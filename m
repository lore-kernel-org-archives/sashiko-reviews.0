Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5573233ED;
	Fri, 22 May 2026 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446691; cv=none; b=PyhnY7XyR7S0aGXeTWGmI6w124Ce8SRChh9scs8sjLC0c2vbRCstWMOb7XA3egOtQOgId3WKUTr7VTU6STSD6GZy5ZsBpNCIINWJ2B3Pikf+v+aWitGNlza1Ib4rANoD9HlZWIW234M33avPzcyCi7mw0PSrUM03Mp7PZ4ld+Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446691; c=relaxed/simple;
	bh=qu97kFPigUJFnfn0oMzF0ND0GUMl25D3w22C5QA2TQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2LPRTlfAKG6b3SyaWwJRqA++dOdCU8TpE+hJx8P891eRRxLt1qyOOV3OmV5QVZ2Y3nrvAPP+lWmerKQYlXd5P/rgMtfbDls/LXwihNeqUWywjniFIUMh3BOMjWnnFfPIZoP8Iux5H67m84lGRnLcgS5+Zxq55byS1DlsVojio4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBlcQfpX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBlcQfpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245901F000E9;
	Fri, 22 May 2026 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779446689;
	bh=D7blBQmroDeTnVftbWiUElk5r8f+qUupeB7df97/Pak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OBlcQfpXr05HcYteALrtvl3TiDkfEF7iLSZvxfvGimKS2I+jUOVHagLExOEpqy8ws
	 lSrLPp88pWHJsAkztozNs+3SwczZDJ8PrBWZsdiTNPD10o1WaZ0dC69mWK0BdK0aCH
	 Mblf4WUMa6QUchPR3PWGFFgabLStFeQ13v/NxBRjLjoeauyOuHSwKW+5bH+eMU3lhP
	 aN3p8o/Adp3s+pYk+4gnLVG/THNuKpTW82ZBSOAlG6chEoUm+rhF/g38g12qjLcgQc
	 FLHiL9+mEABkwUIzXtaQgA7fALmMt4eQPT1ZzW35K1CwR4sl1J2DDWUSliCx+LMLfd
	 DAesSiTuoV6oA==
Date: Fri, 22 May 2026 16:14:45 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 05/16] remoteproc: qcom_q6v5_pas: Switch over to
 generic PAS TZ APIs
Message-ID: <ahAznR7z3rYZCbwX@sumit-xelite>
References: <20260518072856.22790-6-sumit.garg@kernel.org>
 <20260519073355.98831C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519073355.98831C2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 07:33:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] Unconditionally calling `qcom_scm_assign_mem()` without checking SCM availability causes a NULL pointer dereference on non-SCM platforms.
> - [High] MDT firmware loading is not abstracted and continues to hardcode SCM APIs, causing both a build warning and functional failure on non-SCM backends.
> - [High] The DTB subsystem (dtb_pas_id) is authenticated but never shut down in the error paths of qcom_pas_start().
> - [High] The firmware object pas->dtb_firmware is leaked on the success path of qcom_pas_load().
> --
> 
> commit e21bc74de5d7e3215e46e9baa1c3a6b26f353409
> Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> remoteproc: qcom_q6v5_pas: Switch over to generic PAS TZ APIs
> 
> This patch switches the qcom_q6v5_pas client driver over to generic PAS TZ
> APIs. This allows supporting multiple TrustZone implementation backends
> such as QTEE and OP-TEE.
> 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index da27d1d3c9da6..847249c28c1be 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> [ ... ]
> > @@ -118,8 +119,8 @@ struct qcom_pas {
> >  	struct qcom_rproc_ssr ssr_subdev;
> >  	struct qcom_sysmon *sysmon;
> >  
> > -	struct qcom_scm_pas_context *pas_ctx;
> > -	struct qcom_scm_pas_context *dtb_pas_ctx;
> > +	struct qcom_pas_context *pas_ctx;
> > +	struct qcom_pas_context *dtb_pas_ctx;
> >  };
> 
> Does changing this struct cause a compiler warning and functional regression
> for non-SCM backends?
> 
> Since this patch changes the context type to struct qcom_pas_context * but
> still passes it to qcom_mdt_pas_load(), it appears to cause an incompatible
> pointer type warning.
> 
> Furthermore, qcom_mdt_pas_load() internally hardcodes calls to SCM-specific
> APIs like qcom_scm_pas_init_image(), bypassing the generic PAS backend
> entirely. This seems to prevent the driver from working on non-SCM backends
> like OP-TEE.
> 
> I notice this is fixed later in the series in the commit "soc: qcom:
> mdtloader: Switch to generic PAS TZ APIs", but I am pointing it out here as
> it breaks the build and functionality at this step.

Ack, will rather merge the mdtloader patch into this one instead to
enable git bisection.

> 
> [ ... ]
> > @@ -250,7 +251,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  	return 0;
> >  
> >  release_dtb_metadata:
> > -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > +	qcom_pas_metadata_release(pas->dtb_pas_ctx);
> >  	release_firmware(pas->dtb_firmware);
> >  
> >  	return ret;
> 
> Is there a pre-existing resource leak here?
> 
> When request_firmware() allocates the DTB firmware and qcom_mdt_pas_load()
> succeeds, the function returns 0 and skips the release_dtb_metadata label
> where release_firmware() is called.
> 
> The pas->dtb_firmware pointer appears to be retained but never freed in any
> teardown function like qcom_pas_unprepare() or qcom_pas_stop(). Could this
> permanently leak the firmware object and its backing buffer on every
> successful start?

Out of scope for this patch-set.

> 
> [ ... ]
> > @@ -339,13 +340,13 @@ static int qcom_pas_start(struct rproc *rproc)
> >  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
> >  	if (ret == -ETIMEDOUT) {
> >  		dev_err(pas->dev, "start timed out\n");
> > -		qcom_scm_pas_shutdown(pas->pas_id);
> > +		qcom_pas_shutdown(pas->pas_id);
> >  		goto unmap_carveout;
> >  	}
> 
> Does this error path miss shutting down the DTB subsystem?
> 
> While this was not introduced by this patch, if the DTB authentication
> step earlier in this function succeeds, but a subsequent step like
> qcom_q6v5_wait_for_start() fails, the error path shuts down the main PAS but
> misses calling qcom_pas_shutdown(pas->dtb_pas_id).
> 
> The code then jumps to unmap_dtb_carveout and unmaps the Linux-side memory,
> leaving the DTB subsystem active in TrustZone while its backing memory is
> unmapped.
> 

Out of scope for this patch-set.

> [ ... ]
> > @@ -746,7 +747,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
> >  	if (!desc)
> >  		return -EINVAL;
> >  
> > -	if (!qcom_scm_is_available())
> > +	if (!qcom_pas_is_available())
> >  		return -EPROBE_DEFER;
> >  
> >  	fw_name = desc->firmware_name;
> 
> Could this change lead to a NULL pointer dereference on non-SCM platforms?
> 
> By replacing the qcom_scm_is_available() check with qcom_pas_is_available(),
> the probe function can now continue on platforms using non-SCM backends like
> OP-TEE.
> 
> However, further down in probe, qcom_pas_assign_memory_region() is still
> unconditionally called if pas->region_assign_idx is set:
> 
> qcom_pas_assign_memory_region()
>    qcom_scm_assign_mem()
> 
> qcom_scm_assign_mem() accesses __scm->mempool without checking if __scm is
> NULL. On non-SCM platforms, __scm will be NULL, which seems like it would
> cause a kernel panic during probe for devices requiring memory region
> assignment.

qcom_scm_assign_mem() is still supported with an OP-TEE PAS backend too.

-Sumit
