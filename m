Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55473890E4;
	Fri, 17 Jul 2026 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273184; cv=none; b=cZVBL3ZrsXs3WTuVQEPbD6TVH/+1HP98/AJZtIU5PVnxOZAidx++jTNfPTKjbXecl3rsDBzPKLbx4lHTFsnG23MyeVFHVo4gpheiF64kt4GtoQjO7i15+xcPwQ4uw1haMth+KBc6e3MrfJrwp0P1P5bznwgF2rzYeNBrpLpz730=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273184; c=relaxed/simple;
	bh=UIbui/chiiJBvHN7sGhVyTjdeFSvelYT+4T85sPAmXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGSqxsIsEBbwZdiS48Jz0GJXXYQHsgegxjOQyCyVNVUE2BTGYjjIvu3ihlcvhhUauW7u7t7b+B/wOAeaVqtqM0PQ2Cu77SL0mb1eAcciem1CSinpeKU/2H9L/BCpe38pFlPkfD11sNhi5TPKqboqihMMfvCCoUnpEosgN5aoAX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpwQT8xZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpwQT8xZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17B91F000E9;
	Fri, 17 Jul 2026 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784273182;
	bh=Rtmrjy1XM2eI2QUHDorJnuTSC4NyenPnYLnBGTLi//w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TpwQT8xZ60u7kgvS/+KEGOVaxnME2jKRo6ECe+cziU/pvy/XOqgX9FerRi1YIgsxY
	 CGxurGd1kzb/w5who+0KPzdPHSguPN8bVGdFIeV1wbCKuJ4AV/E4aTKHMpLSvRhit8
	 AKa5x8KulMpVTnHzHe66900M4weLVjX3qHLMtkK6DZ6l+/EoSF62xEthv/V1VwLRnD
	 bbbh6gd0QqMNhYgpZvUnV2Se6n1d+zjU41IYMDJKsdi0OOrN3mCRRDSsx8Og4d2E3C
	 TvYLgGrH5vHEGvgclq81QwII+mIUSkLi+IB6z3UOXopR3YxVvGH7gkE0L/Sju62tgO
	 BAeyl7ih+BDxQ==
Message-ID: <b5c0de1f-75e3-443e-9e29-a70fbdbf4441@kernel.org>
Date: Fri, 17 Jul 2026 08:26:18 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/msm/dp: return 0 from audio_prepare when cable is
 disconnected
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 sashiko-reviews@lists.linux.dev, Kumar Anurag
 <kumar.singh@oss.qualcomm.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org
References: <20260616151252.3599089-2-kumar.singh@oss.qualcomm.com>
 <20260616152536.D81FB1F000E9@smtp.kernel.org>
 <5ixuxbgngzobl5c5fsyahdsouohwuykoat7s4hy6sczrye7vwf@rj7nmn7x3c56>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <5ixuxbgngzobl5c5fsyahdsouohwuykoat7s4hy6sczrye7vwf@rj7nmn7x3c56>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/12/26 11:16 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 16, 2026 at 03:25:36PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Returning success (0) from `msm_dp_audio_prepare` when the display is disconnected causes silent audio failures upon hotplug and NoC errors due to unclocked DSP hardware access.
>>
>> Pre-existing issues:
>> - [High] Race condition between `msm_dp_audio_prepare` and `msm_dp_display_disable` causes unclocked MMIO accesses.
>> --
>>
>> commit bfb65364e66313dc1385a42e09172f44a1e1fbd1
>> Author: Kumar Anurag <kumar.singh@oss.qualcomm.com>
>>
>> drm/msm/dp: return 0 from audio_prepare when cable is disconnected
>>
>> PipeWire treats a non-zero return from prepare as fatal, marking the
>> DP audio device as a dummy sink when the cable is unplugged.
>>
>>> The active_stream_cnt guard already prevents any unclocked hardware access,
>>> so return success instead of -EINVAL when the link is not active.
>>
>> [Severity: High]
>> Is this commit message accurate for the upstream tree? There doesn't appear
>> to be an active_stream_cnt guard in the mainline driver. Without this guard,
>> will the DSP push data to powered-off, unclocked DP hardware and cause NoC
>> errors?
> 
> $ git describe
> v7.2-rc2-4669-gb9810cd75b9f
> $ git grep active_stream_cnt
> $
> 
> Which tree has this commit message been based on?
> 
>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> index 41018e82efa10..df222943ae57f 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> @@ -284,10 +284,8 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
>>>  	 * such cases check for connection status and bail out if not
>>>  	 * connected.
>>>  	 */
>>> -	if (!msm_dp_display->power_on) {
>>> -		rc = -EINVAL;
>>> +	if (!msm_dp_display->power_on)
>>>  		goto end;
>>
>> [Severity: High]
>> Does returning 0 here trick the ALSA/ASoC framework into marking the stream
>> as successfully prepared?
>>
>> If the stream is marked RUNNING, ALSA won't re-invoke prepare() when the
>> display is later connected. Could this regression result in silent playback
>> because the DP hardware is never actually configured?
>>
>> [Severity: High]
>> This is a pre-existing issue, but does this lockless check of power_on
>> race with msm_dp_display_disable()?
>>
>> If msm_dp_display_disable() runs concurrently (e.g., from a hotplug interrupt)
>> immediately after this check but before audio_enabled is set to true, it will
>> skip waiting and disable the DP link and clocks.
>>
>> When msm_dp_audio_prepare() resumes, it will call msm_dp_audio_setup_sdp() and
>> attempt MMIO operations on unclocked DP audio registers. Could this lead to a
>> synchronous external abort?
> 
> I'd agree with Sashiko here. Do we guard against the unlocked access? Or
> how do we ensure that the stream will be prepared later?
> 
> I think this needs to be fixed on the other side of the pipe. Do we need
> to define a special prepare error code, which means "working, but not
> available now" and make PulseAudio / PipeWire handle those errors
> specially? How is it solved for other platforms? I don't think that
> msm/dp is unique here.

AFAIU,There is no special error code for prepare to flag that cable is
not connected, the standard way is to read Jack events. Wireplumber is
is one which deals with Jack event, even before getting to there
pipewire will fail to probe the devices on the card if prepare fails.

Once we are at Wireplumber level we are good, and stream will never sent
to the sinks which are in disconnected state (via Jack).

This has been a known issue for very long time, most of the codecs like

Its also interesting to note that same Qualcomm SoC drivers deal with
this situation by returning zero, so why dp has to be different?

drivers/gpu/drm/msm/hdmi/hdmi_audio.c

Other drivers that do not care about plug state in prepare are.
sound/x86/intel_hdmi_audio.c
drivers/gpu/drm/mediatek/mtk_hdmi.c
sound/hda/codecs/hdmi/hdmi.c
drivers/gpu/drm/xlnx/zynqmp_dp_audio.c


I think there is enough evidence how this is handled in the codec
drivers, we should consider this patch.

--srini


> 
> Mark, would you have any particular recommendations?
> 

