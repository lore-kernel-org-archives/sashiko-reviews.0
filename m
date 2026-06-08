Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6745F3101D4
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919196; cv=pass; b=Q/O9hH74/1wDlTiOzUrOByqP1ivJZ6BxcWwi5QZ+s8BfvDjUo2W7ha98bQPrRRVvyhZmgW2rFTdPWBX5Nzh4TnSyT0VVvuTGyA2xwyz+A/P0Vs5qDQLBFqoQjYFZwhMYBBdaGPcivkBSbu1TZTE9JExL383+7MM5z7Mo3IB3/jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919196; c=relaxed/simple;
	bh=m5sBQbsGnCYpKoOs0vgIuKHTR/adBgh9tS2QB3LnWik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o5ZgRkXDvzrV6OkGpOpc/wV+jNNNX2w58TogV27koUoWqJNQVo+FIDIbx73DryHu3Bs4QDJaJF6OjYPfMYZ6EJWm8okpqpNsoEjEwd0Js3O5uiF/z8v5T97dP74iqDLM+DJJkj+O2OJvQbZ6rFET1KYEjhnBztxsRwbcAahe+Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Cl82lHQk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Cl82lHQk"
ARC-Seal: i=1; a=rsa-sha256; t=1780919192; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IZnK2esWM0HeOWRj3yx5gkyStBBtajBWiqmaUsCjO52urHadfjRXH0YqXZ4WNnXUQ9OV8juCa3JLu6EhC1hwK7sjfRiYyxVKbNcDLOWBvvvAntjx2a1vMEYHUJVPKyjZkkINklMpJKRnd05vbKSO0aLW8o3giROdKevaFw2/3I4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780919192; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gpm9tofYuThT3DdGwbZoDTaTeH3rNfgAGSRNVApSjTA=; 
	b=MjLMHJMJsiX3qU8m/0Hea+0zzwe7Tun5Wucb6WaG9sOnvcMkr8RCO3he/BKwNMLAZBb7m1JoVSzWQDpFn/boy4KO4xuwVokXVaY7KeiXOr5IL6OJi41aAke1gqRTW/xP+XoXkekHDGCew9Fm44oboBOo+T7Jp/2/efL6gY8fekM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780919192;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=Gpm9tofYuThT3DdGwbZoDTaTeH3rNfgAGSRNVApSjTA=;
	b=Cl82lHQk7yZPYok+4QE6Mte20DyBADBoLssm/B+KOJH+STu91OCSkc/s1lyB7D/N
	GUQ+UPmgspfbzQTonfskiaEFKJiPj/f7jSQa6FcTXv/t+DLLmYpv0fiCp+BJTRvrvkS
	pHLiMtRJL7ahRcpgooRxtlveXBA3KSEGF8esCsaQ=
Received: by mx.zohomail.com with SMTPS id 178091919124684.90521949997265;
	Mon, 8 Jun 2026 04:46:31 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/display: hdmi: Only allow BPC values of 8, 10,
 12 and 16
Date: Mon, 08 Jun 2026 13:46:27 +0200
Message-ID: <ySc94bL0TleBGnFIdX95hg@collabora.com>
In-Reply-To: <20260608113023.67AFB1F00893@smtp.kernel.org>
References:
 <20260608-hdmi-max-bpc-fix-v1-1-6e8dcebc7274@collabora.com>
 <20260608113023.67AFB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 8 June 2026 13:30:22 Central European Summer Time sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The function `sink_supports_format_bpc` explicitly permits 16 BPC for RGB444 and YCBCR444 formats without verifying if the sink's EDID actually supports 48-bit deep color.
> --
> 
> commit 767fa3cc832e8b93f697ad91bcc66e5b3b1ed85d
> Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> drm/display: hdmi: Only allow BPC values of 8, 10, 12 and 16
> 
> As per the comment in sink_supports_format_bpc(), CTA-861-F defines that
> only bits-per-channel values of 8, 10, 12 and 16 are allowed for HDMI.
> Allowing more than this has surprising consequences for the atomic check
> phase.
> 
> > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > index 4867edbf2622b..b06499dbfe8b3 100644
> > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > @@ -419,6 +419,16 @@ sink_supports_format_bpc(const struct drm_connector *connector,
> >  		return false;
> >  	}
> >  
> > +	switch (bpc) {
> > +	case 8:
> > +	case 10:
> > +	case 12:
> > +	case 16:
> 
> [Severity: High]
> This is a pre-existing issue, but does explicitly allowing 16 BPC here
> expose a missing validation check for 48-bit deep color further down in
> sink_supports_format_bpc()?
> 
> When checking DRM_OUTPUT_COLOR_FORMAT_RGB444 and
> DRM_OUTPUT_COLOR_FORMAT_YCBCR444, the code validates 10 BPC and 12 BPC
> against the EDID flags, but completely omits checking 16 BPC against
> DRM_EDID_HDMI_DC_48:
> 
> drivers/gpu/drm/display/drm_hdmi_state_helper.c:sink_supports_format_bpc() {
> 	...
> 	case DRM_OUTPUT_COLOR_FORMAT_RGB444:
> 		...
> 		if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
> 			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n");
> 			return false;
> 		}
> 
> 		if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
> 			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n");
> 			return false;
> 		}
> 
> 		drm_dbg_kms(dev, "RGB format supported in that configuration.\n");
> 		return true;
> 	...
> }
> 
> If the TMDS clock limit permits it, the driver might incorrectly conclude
> that the sink supports 16 BPC and program the hardware accordingly, which
> could result in a black screen if the monitor doesn't actually support
> 48-bit deep color.
> 
> Should a check for (info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_48)
> be added for the RGB444 and YCBCR444 cases?

Finally, we have automated the ultimate Linux kernel review response:
"while you're at it, can you fix everything else wrong in this code?"

(No, this does not expose any pre-existing issue; the validation is
more restrictive than it was before. That it's still not restrictive
enough in all cases does not introduce a new problem.)

> 
> > +		break;
> > +	default:
> > +		return false;
> > +	}
> > +
> >  	if (!info->is_hdmi &&
> >  	    (format != DRM_OUTPUT_COLOR_FORMAT_RGB444 || bpc != 8)) {
> >  		drm_dbg_kms(dev, "DVI Monitors require an RGB output at 8 bpc\n");
> 
> 




