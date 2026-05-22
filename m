Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075C138734D;
	Fri, 22 May 2026 07:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434068; cv=none; b=H14iFhmb+n1T53u8Q56VnsJvYfBr37KS9HRr4HFICUa2JJpOmxSfL7tVyLiQJ9z7tKxHAzuH9Dv4D0qmwSnT8+e3U2l0sXI73HfBnyz0EVqMZvjcF/3IWES89mo/f7bbGatTkuV/nmYKGdCSEubDoxaQoC5LP1TKlF5ZycQh8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434068; c=relaxed/simple;
	bh=N2eC+F106R16cw9I1D9Z/sdNXXNwnsFRgJfJRD/S6Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVXQnjRb1A5F4hBEOKV6eHccL4JMHbBHPhpSRHgYkGdsQ4rtOCWmHfdPAPA5ZggoLVltYHlGp61UNUr7j1bP4xQMUWlFg6q38bRqCfphtTiadwgo5Km/UWwxGL0D4sX+CakwfL+avOfBTriz/gNtTehuogslBIN7EBVxTwnqNug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X18AaBwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X18AaBwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB381F000E9;
	Fri, 22 May 2026 07:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779434066;
	bh=H5I4rla2ixebbTUw5P2XP85clOxOmqop1k79UpZsBrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X18AaBwDpQf8SQefbUiA2qIAmgl56jjGlqo8g2DAoF6MEPSvrlokA9/O5qpvPawwc
	 9zPeGCNGur0mUzj2D+eM77ZDLnoa7NvdEe+dTQ4Wp0QuA8QZ4npfqQ+yxbwbvS9ZEB
	 hxwIDXPhOCK4LrH/+dCyfCVtihiBCBRFIXouHmphbRL92GzG4I9QZjqEwk7ZGxIFIq
	 kD688rkAK28s6OT3stlCasmHUkSYpJheVPzg3APkzfN18YwXdri8YJ/AfAw3SFt2ol
	 9S5/neBgbs1hhMa0doOWn6eXgy3DBhO3uj5cvoBqO/jwff7Ieo2Hu1xeKnojg3pBJF
	 Ga85/z+A2Z6mw==
Date: Fri, 22 May 2026 12:44:21 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 11/16] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <ahACTS0kHee98ODd@sumit-xelite>
References: <20260518072856.22790-12-sumit.garg@kernel.org>
 <20260519073406.4CA28C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519073406.4CA28C2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 07:34:04AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unconditional use of SCM-specific API (qcom_scm_mem_protect_video_var) will cause a NULL pointer dereference when using a non-SCM TrustZone backend.
> - [High] Migrating to the generic PAS API exposes a TOCTOU race and Use-After-Free due to a lack of backend provider lifetime management.
> --
> 
> commit 2d2fe5038803b9390438e02f3c0f53b945cc9bdc
> Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> media: qcom: Switch to generic PAS TZ APIs
> 
> This commit switches the Qualcomm media client drivers to use the generic
> PAS TZ APIs instead of the SCM-specific ones. This allows the drivers to
> support multiple TrustZone backend implementations such as QTEE and OP-TEE.
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 5f408024e967f..b3c5281aea919 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> [ ... ]
> > @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
> >  		return -ENOMEM;
> >  	}
> >  
> > -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> > +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
> 
> Does moving to the generic PAS API introduce a race condition with module
> unloading?
> 
> Looking at the generic PAS wrapper qcom_pas_auth_and_reset() in
> drivers/firmware/qcom/qcom_pas.c:
> 
> int qcom_pas_auth_and_reset(u32 pas_id)
> {
> 	if (!ops_ptr)
> 		return -ENODEV;
> 
> 	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> }
> 
> If the PAS backend module is unloaded concurrently, ops_ptr could be set to
> null after the check but before the function pointer is invoked. Do the
> client drivers need to hold a reference count to pin the backend provider
> in memory before calling these APIs to avoid a use-after-free?

The PAS backend is not expected to be unloaded for the entire boot power
cycle. This is the same behavior as the existing SCM backend, so not an
issue.

> 
> [ ... ]
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 1de7436713ed9..3a38ff985822f 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> [ ... ]
> > @@ -218,7 +219,7 @@ int venus_boot(struct venus_core *core)
> >  	int ret;
> >  
> >  	if (!IS_ENABLED(CONFIG_QCOM_MDT_LOADER) ||
> > -	    (core->use_tz && !qcom_scm_is_available()))
> > +	    (core->use_tz && !qcom_pas_is_available()))
> >  		return -EPROBE_DEFER;
> 
> If the platform uses a non-SCM TrustZone backend like OP-TEE,
> qcom_pas_is_available() will return true, but the qcom_scm subsystem
> might not be probed.

qcom_scm is also probed based on DT alongside OP-TEE to support the
other SCM calls which are compliant to SiP SMC specification. So not an
issue.

> 
> Will this lead to a null pointer dereference later in venus_boot() when
> it calls the SCM-specific API?
> 
> venus_boot() {
>     ...
> 	if (core->use_tz && res->cp_size) {
> 		ret = qcom_scm_mem_protect_video_var(res->cp_start,
> 						     res->cp_size,
> 						     res->cp_nonpixel_start,
> 						     res->cp_nonpixel_size);
> 	}
>     ...
> }
> 
> Looking at qcom_scm_mem_protect_video_var(), it executes
> qcom_scm_call(__scm->dev, ...). If __scm is null because the SCM
> subsystem is absent, this dereference might cause a panic.

SCM subsystem is always present, it's only the PAS calls being handled
by this OP-TEE backend now. So, no case of a panic.

-Sumit

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518072856.22790-1-sumit.garg@kernel.org?part=11
