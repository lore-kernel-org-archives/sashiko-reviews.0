Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD283438A2;
	Fri, 22 May 2026 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446405; cv=none; b=fOl4JD/npyD1ovGYDmp5muvWq3v0LghoTqGC0vhCH1ahAKlzP7REnv0G0Zk6VL3F5iqS+JCtX7Mgnp0sPRxC6/GPlHhJLBiDCNXBQW+mdY4mZRCWfheHDwDv5cQxo7cysXy8WrE6bZNW0dOp3ek82nfNtUq4rcmN2L8zCYhocqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446405; c=relaxed/simple;
	bh=c0BeStXdY1FuuRgE12pPYKk+yXdU62dLQ+ab1L+PruA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk50JbhN6YJh//H5ebgcr3uyQ7IsVPIeOdWRzW+4L0ygIPKPOIfxXU44h+i9IXOgUsmO4fsnsz0l9I9qfh16OMsIrcMtYbUWqmh89vqLcCC8dt+TUl5GqRnI6INwuvKlHW1mBTyEm4dOyl+mQyPi15CC+Biql3Oxvtv+yuPhVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0uKlOyt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0uKlOyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4581F000E9;
	Fri, 22 May 2026 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779446404;
	bh=TOeENsJONCm8A8ptsypYNFAVXXJmb30h97nu7b0oPA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C0uKlOyt9wx1ZuV5BLASb/MIxwa+P55xZoZrWACqPyhWcqOPbkRP0imyt9YwbsFV7
	 1GROqPhdzZTtqWlEcoktRpKpS970YtozTVF2KqaywwjfG2+l+Zjs2eKR559hdcb/iY
	 jljzyjV1EuFbSLkXsdCxuDOCU4yxB8o13643wsUjuOWsCoZhvXqtbqkEw0XNUxQuA0
	 C8FO7dfhh6Rfi6ECodZYCELW0Tvozqf+Zzvs7OGejUKRz9MK2+v9Ary1OHqNTd7y7u
	 hG2VNtUNmpgQPz5LdzpNQYfY2amEusjavnlfAp3rwcnLygojJplV5FUGRCGWFfI7MW
	 pdqLCxd9/Dmyw==
Date: Fri, 22 May 2026 16:09:59 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 04/16] firmware: qcom: Add a PAS TEE service
Message-ID: <ahAyf4i7ZZrJETG9@sumit-xelite>
References: <20260518072856.22790-5-sumit.garg@kernel.org>
 <20260519073354.03927C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519073354.03927C2BCB3@smtp.kernel.org>

On Tue, May 19, 2026 at 07:33:53AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] Unvalidated buffer sizes from TEE lead to heap buffer overflow and out-of-bounds read.
> - [High] The `shm_free` cleanup wrapper fails to handle `ERR_PTR`, causing a kernel crash on allocation failure.
> - [High] Unconditional unregistration and global static ops structure corruption in probe/remove.
> --
> 
> commit 117a287c92ded04ad43f9ed963b43a8069a13f94
> Author: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> firmware: qcom: Add a PAS TEE service
> 
> Add support for Peripheral Authentication Service (PAS) driver based
> on TEE bus with OP-TEE providing the backend PAS service implementation.
> 
> > diff --git a/drivers/firmware/qcom/qcom_pas_tee.c b/drivers/firmware/qcom/qcom_pas_tee.c
> > new file mode 100644
> > index 0000000000000..2067a43c44c37
> > --- /dev/null
> > +++ b/drivers/firmware/qcom/qcom_pas_tee.c
> > @@ -0,0 +1,476 @@
> [ ... ]
> > +DEFINE_FREE(shm_free, struct tee_shm *, tee_shm_free(_T))
> 
> Will this crash if an allocation failure occurs? By default, DEFINE_FREE
> only guards against NULL pointers. However, tee_shm_alloc_kernel_buf() can
> return an ERR_PTR, which evaluates to true.
> 
> > +
> > +static void *qcom_pas_tee_get_rsc_table(struct device *dev,
> > +					struct qcom_pas_context *ctx,
> > +					void *input_rt, size_t input_rt_size,
> > +					size_t *output_rt_size)
> > +{
> [ ... ]
> > +	if (param[1].u.memref.size) {
> > +		struct tee_shm *rt_shm __free(shm_free) =
> > +			tee_shm_alloc_kernel_buf(data->ctx,
> > +						 param[1].u.memref.size);
> 
> If this allocation fails, rt_shm will be an ERR_PTR. When the function
> returns early, shm_free will pass the ERR_PTR to tee_shm_free(), triggering
> a kernel panic.

Ack, will fix it.

> 
> > +		void *rt_shm_va;
> > +
> > +		if (IS_ERR(rt_shm)) {
> > +			dev_err(dev, "rt_shm allocation failed\n");
> > +			return rt_shm;
> > +		}
> > +
> > +		rt_shm_va = tee_shm_get_va(rt_shm, 0);
> > +		if (IS_ERR(rt_shm_va)) {
> > +			dev_err(dev, "rt_shm get VA failed\n");
> > +			return ERR_CAST(rt_shm_va);
> > +		}
> > +		memcpy(rt_shm_va, input_rt, input_rt_size);
> 
> Can this cause a heap buffer overflow? The buffer is allocated using
> param[1].u.memref.size, but the code unconditionally copies input_rt_size
> bytes into it.

Nope, param[1].u.memref.size is always more or equal to input_rt_size
based on OP-TEE ABI.

> 
> > +
> > +		param[1].u.memref.shm = rt_shm;
> > +		ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
> > +		if (ret < 0 || inv_arg.ret != 0) {
> > +			dev_err(dev, "PAS get RT failed, pas_id: %d, ret: %d, err: 0x%x\n",
> > +				ctx->pas_id, ret, inv_arg.ret);
> > +			return ret ? ERR_PTR(ret) : ERR_PTR(-EINVAL);
> > +		}
> > +
> > +		if (param[1].u.memref.size) {
> > +			*output_rt_size = param[1].u.memref.size;
> > +			rt_buf = kmemdup(rt_shm_va, *output_rt_size, GFP_KERNEL);
> 
> Does this kmemdup() introduce an out-of-bounds read? The size returned by
> the TEE in param[1].u.memref.size could potentially be larger than the
> originally allocated size.

Nope, this won't happen as it's part of OP-TEE ABI.

> 
> > +			if (!rt_buf)
> > +				return ERR_PTR(-ENOMEM);
> > +		}
> > +	}
> > +
> > +	return rt_buf;
> > +}
> [ ... ]
> > +static struct qcom_pas_ops qcom_pas_ops_tee = {
> > +	.drv_name		= "qcom-pas-tee",
> > +	.supported		= qcom_pas_tee_supported,
> > +	.init_image		= qcom_pas_tee_init_image,
> > +	.mem_setup		= qcom_pas_tee_mem_setup,
> > +	.get_rsc_table		= qcom_pas_tee_get_rsc_table,
> > +	.auth_and_reset		= qcom_pas_tee_auth_and_reset,
> > +	.prepare_and_auth_reset	= qcom_pas_tee_prepare_and_auth_reset,
> > +	.set_remote_state	= qcom_pas_tee_set_remote_state,
> > +	.shutdown		= qcom_pas_tee_shutdown,
> > +	.metadata_release	= qcom_pas_tee_metadata_release,
> > +};
> > +
> > +static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> > +{
> > +	return ver->impl_id == TEE_IMPL_ID_OPTEE;
> > +}
> > +
> > +static int qcom_pas_tee_probe(struct tee_client_device *pas_dev)
> > +{
> > +	struct device *dev = &pas_dev->dev;
> > +	struct qcom_pas_tee_private *data;
> [ ... ]
> > +	data->session_id = sess_arg.session;
> > +	dev_set_drvdata(dev, data);
> > +	qcom_pas_ops_tee.dev = dev;
> 
> Could concurrent probes overwrite this shared static structure? Since the ops
> structure is global, multiple devices probing at the same time could clobber
> the dev pointer.

Only single device is supported on TEE bus here.

> 
> > +	qcom_pas_ops_register(&qcom_pas_ops_tee);
> 
> Should this check for a return value or register failure? If another backend
> like SCM is already registered, this operation will fail, but the probe
> routine proceeds as if it was successful.

Only one PAS backend is expected to be present at a time.

> 
> > +
> > +	return ret;
> > +}
> > +
> > +static void qcom_pas_tee_remove(struct tee_client_device *pas_dev)
> > +{
> > +	struct device *dev = &pas_dev->dev;
> > +	struct qcom_pas_tee_private *data = dev_get_drvdata(dev);
> > +
> > +	qcom_pas_ops_unregister();
> 
> If the registration failed in probe, will this unconditionally unregister the
> active SCM backend and break PAS functionality system-wide?

Concurrent PAS backends aren't supported.

-Sumit

> 
> > +	tee_client_close_session(data->ctx, data->session_id);
> > +	tee_client_close_context(data->ctx);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518072856.22790-1-sumit.garg@kernel.org?part=4
