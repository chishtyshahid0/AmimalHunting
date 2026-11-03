using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;

namespace WordWiz
{
	public class UIBase : MonoBehaviour
	{
		[SerializeField]
		private Transform[] topElements;

		[SerializeField]
		private Transform[] bottomElements;

		[SerializeField]
		private Transform[] leftElements;

		[SerializeField]
		private Transform[] rightElements;

		[SerializeField]
		private Transform[] onlyFadeElements;

		[SerializeField]
		private Transform[] AnimElements;

		[SerializeField]
		private Transform[] scaleElements;

		public float distance = 150f;

		public float time = 0.4f;

		public float Delay = 2f;

		public float onlyFadeDelay;

		[SerializeField]
		private Image[] imgs;

		[SerializeField]
		private Text[] txts;

		private Ease momentEaseIn = Ease.OutCubic;

		private Ease momentEaseOut = Ease.InBack;

		[SerializeField]
		private bool needBtnOpenSound = true;

		private float outDelay = 0.1f;

		[SerializeField]
		private bool needFade = true;

		[SerializeField]
		private bool IsScaleAnim;

		private void OnEnable()
		{
			TweenInAllElements();
		}

		private void OnDisable()
		{
		}

		public void TweenInAllElements()
		{
			if (needBtnOpenSound)
			{
				for (int i = 0; i < topElements.Length; i++)
				{
					//FadeIn(topElements[i]);
					topElements[i].localPosition += Vector3.up * distance;
					topElements[i].DOLocalMove(topElements[i].localPosition - Vector3.up * distance, time).SetDelay(Delay).SetEase(momentEaseIn);
				}
			}
			for (int j = 0; j < bottomElements.Length; j++)
			{
				//FadeIn(bottomElements[j]);
				bottomElements[j].localPosition -= Vector3.up * distance;
				bottomElements[j].DOLocalMove(bottomElements[j].localPosition + Vector3.up * distance, time).SetDelay(Delay).SetEase(momentEaseIn);
			}
			for (int k = 0; k < leftElements.Length; k++)
			{
				FadeIn(leftElements[k]);
				leftElements[k].localPosition -= Vector3.right * distance;
				leftElements[k].DOLocalMove(leftElements[k].localPosition + Vector3.right * distance, time).SetDelay(Delay).SetEase(momentEaseIn);
			}
			for (int l = 0; l < rightElements.Length; l++)
			{
				FadeIn(rightElements[l]);
				rightElements[l].localPosition += Vector3.right * distance;
				rightElements[l].DOLocalMove(rightElements[l].localPosition - Vector3.right * distance, time).SetDelay(Delay).SetEase(momentEaseIn);
			}
			for (int m = 0; m < onlyFadeElements.Length; m++)
			{
				FadeIn(onlyFadeElements[m], onlyFadeDelay);
			}
		}

		public void TweenOutAllElements()
		{
			for (int i = 0; i < topElements.Length; i++)
			{
				FadeOut(topElements[i]);
				topElements[i].DOLocalMove(topElements[i].localPosition - Vector3.up * distance, time).SetDelay(outDelay).SetEase(momentEaseOut);
			}
			for (int j = 0; j < bottomElements.Length; j++)
			{
				FadeOut(bottomElements[j]);
				bottomElements[j].DOLocalMove(bottomElements[j].localPosition + Vector3.up * distance, time).SetDelay(outDelay).SetEase(momentEaseOut);
			}
			for (int k = 0; k < leftElements.Length; k++)
			{
				FadeOut(leftElements[k]);
				leftElements[k].DOLocalMove(leftElements[k].localPosition + Vector3.right * distance, time).SetDelay(outDelay).SetEase(momentEaseOut);
			}
			for (int l = 0; l < rightElements.Length; l++)
			{
				FadeOut(rightElements[l]);
				rightElements[l].DOLocalMove(rightElements[l].localPosition - Vector3.right * distance, time).SetDelay(outDelay).SetEase(momentEaseOut);
			}
			for (int m = 0; m < onlyFadeElements.Length; m++)
			{
				FadeOut(onlyFadeElements[m], onlyFadeDelay);
			}
			Invoke("OnCompleteTween", outDelay);
		}

		public void ScaleAllElements()
		{
			for (int i = 0; i < scaleElements.Length; i++)
			{
				scaleElements[i].DOScale(Vector3.one, Delay);
			}
		}

		public virtual void OnCompleteTween()
		{
		}

		private void FadeIn(Transform gob, float delay = 0f)
		{
			if (needFade)
			{
				imgs = gob.GetComponentsInChildren<Image>();
				txts = gob.GetComponentsInChildren<Text>();
				for (int i = 0; i < imgs.Length; i++)
				{
					Color color = imgs[i].color;
					color.a = 0f;
					imgs[i].color = color;
					//imgs[i].DOFade(1f, time).SetDelay(Delay + delay).SetEase(momentEaseIn);
				}
				for (int j = 0; j < txts.Length; j++)
				{
					Color color2 = txts[j].color;
					color2.a = 0f;
					txts[j].color = color2;
					//txts[j].DOFade(1f, time).SetDelay(Delay + delay).SetEase(momentEaseIn);
				}
			}
		}

		public void FadeOut(Transform gob, float delay = 0f)
		{
			Image[] componentsInChildren = gob.GetComponentsInChildren<Image>();
			Text[] componentsInChildren2 = gob.GetComponentsInChildren<Text>();
			//for (int i = 0; i < componentsInChildren.Length; i++)
			//{
			//	componentsInChildren[i].DOFade(0f, time).SetDelay(outDelay - outDelay).SetEase(momentEaseOut);
			//}
			//for (int j = 0; j < componentsInChildren2.Length; j++)
			//{
			//	componentsInChildren2[j].DOFade(0f, time).SetDelay(outDelay - outDelay).SetEase(momentEaseOut);
			//}
		}

		public void ScaleLoopObjects()
		{
			if (IsScaleAnim)
			{
				for (int i = 0; i < AnimElements.Length; i++)
				{
					AnimElements[i].transform.DOPunchScale(Vector3.one * 0.1f, 1f, 1).SetLoops(-1, LoopType.Yoyo);
				}
			}
		}

		public void StopScaleLoopObjects()
		{
			for (int i = 0; i < AnimElements.Length; i++)
			{
				AnimElements[i].transform.DOKill();
			}
		}
	}
}
