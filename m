Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107E9443;
	Fri, 22 May 2026 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436952; cv=none; b=sClHMaHvKcIem2qyigvx7vB5VeTT2MqBqUMsVezqnFKlMWxMN+uZZAYFxTivZ2eEP4y7eNDprK2d8Y/dhl/bCNm356FXGaCKcyRj1Twy6vcldL0bM1aMXhHoKN/h+9+zlGoxSqArKAThRkikqce/mleT3NPeqiez+fokFmyq5ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436952; c=relaxed/simple;
	bh=6RfxzpT0OfB7IdgzCxBhivmzkkByLPmVfCCe9SbI8MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dj6LpAdABxxCcuw2hBbFwtJOgteYFyLnTDybkc4VQBdrqbrZ8dK4Pv2nlHoTWUw9fqGGkR810fYUQx4V07Z7BNfvkE8ymky71OIiNjTmV+JJXMp6N9D6SY4cTkThNRdgj717D6MnztQFE93H0e8+QHZLMr8XicmiUfwX8UMvRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmLQcmP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmLQcmP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867851F000E9;
	Fri, 22 May 2026 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779436951;
	bh=hLNI/hs/U/gh7fyQT9b4RAbh00jmi8/uA0PXno0Fu1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AmLQcmP4K5tQDbcRSfpGuh7O8qSJm+Cd9lwIJWDINlmQ2ubv6KcMhUWinkGn1/h/u
	 aay0j3YKZzD3G8G3JSKxMUPLvn/Zxr1HUJWjXDdphsYnKeq6j2BfoEE+LHdW6UGTxZ
	 YktCO78FCwjIT2YILlcz1V1VBnCr/3kf7D3xbKQn5I2iehlxU6jxJDpxiGfjRJhB3Y
	 Lx3+w1QR/JDfo3Quw5ZW5cNwvsVAG10VEa80vGP64bCMA0EwFaQGbP2cGHMy4uc3gC
	 PTlh3aeALxY2TsE3nQOeUi4vrnsOZXUAnTivmy3yyb51fM2Q6FNEwGPQi64lx5PR6B
	 LS5+661fVLZQg==
Date: Fri, 22 May 2026 13:32:26 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v6 03/16] firmware: qcom_scm: Migrate to generic PAS
 service
Message-ID: <ahANklsQYDiuKrqH@sumit-xelite>
References: <20260518072856.22790-4-sumit.garg@kernel.org>
 <20260519073347.B999AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519073347.B999AC2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 07:33:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing NULL pointer check in `__qcom_scm_pas_metadata_release` leads to a kernel warning on error paths.
> --
> 
> commit d6345df3a23d159b333a40adf86ed6859c37ccc5
> Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> firmware: qcom_scm: Migrate to generic PAS service
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> 
> [ ... ]
> 
> > -/**
> > - * qcom_scm_pas_metadata_release() - release metadata context
> > - * @ctx:	pas context
> > - */
> > -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> > +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> > +			    struct qcom_scm_pas_context *ctx)
> >  {
> > -	if (!ctx->ptr)
> > -		return;
> > +	return __qcom_scm_pas_init_image2(__scm->dev, pas_id, metadata, size,
> > +					  (struct qcom_pas_context *)ctx);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
> >  
> > +static void __qcom_scm_pas_metadata_release(struct device *dev,
> > +					    struct qcom_pas_context *ctx)
> > +{
> >  	if (ctx->use_tzmem)
> >  		qcom_tzmem_free(ctx->ptr);
> 
> Since the original if (!ctx->ptr) check was removed here, could this result
> in calling qcom_tzmem_free(NULL) on error paths?
> 
> Client drivers like qcom_q6v5_pas unconditionally call
> qcom_scm_pas_metadata_release() during cleanup, even if
> qcom_scm_pas_init_image() failed or was bypassed. In these cases, ctx->ptr
> would still be NULL.
> 
> Calling qcom_tzmem_free(NULL) unconditionally triggers a warning inside the
> allocator.
> 
> While this is fixed later in the patch series when all callers migrate to
> the generic PAS API and the legacy wrappers are dropped, does this
> intermediate patch break bisectability by introducing these warnings on
> error paths?

Not an issue as generic PAS APIs perform proper NULL check.

-Sumit

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518072856.22790-1-sumit.garg@kernel.org?part=3
