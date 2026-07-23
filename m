Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50314DB549;
	Thu, 23 Jul 2026 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813842; cv=none; b=h2hzWHHW6QjTwTB2L3NEfg3+/B4LHSZz9KRTSxRPtxBBVaKgEPmmdHmrPaF1deOEJIH+OhzdpYib63n4EtwowQiWmwCYlblfWSvaj0RKSmQ07U1PpcBmYyOj7c0bWjlIcwUTGYczL6KpWNKolkVb5URTZ/waDNMbX2tlK1d29Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813842; c=relaxed/simple;
	bh=ux96JHRvVVpout67821Hsu/xYkq+I8zUWvKumxd41PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9FEbKyw/Ud0wUCNfMig5AnKrlPdoacm6XU0t21LNJtzo2hJmD6/uLQ/GSZcdhqiYeLzgRFxKR9/QSwzTCCz2AUlsnJA6mGXZ+DDq5a8lcefE2MPh+2gccdb1Yj+htOHFwMN4374RskjjKphSs3/Q+IiJv7RFh5kdpExeOvyXbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4CM9y+I; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4CM9y+I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D1D1F00A3A;
	Thu, 23 Jul 2026 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784813836;
	bh=t/KFcynf/k9c8mZW4LGu8D4kjq0zTk/109tsCS8SqKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D4CM9y+In3+nzlP2NeBxy5pUW+2v3MRmetmRSB0ebBYfSSG2yJYCCNQdK34UVVAjU
	 PtEPUVAiNcR1MAeseQ3n/p38g/LFXkExP3OXeQdyJ046JiWVWLuC9Bx54cRdBccxro
	 Ay/2OYIEKZKpa/l8t65qSmoNOMVm20T1dUPK13Xb2uGzGbCppwG00ed30N9L1WBZ8z
	 ps99t00h43WeH0KEBemf25BSo/DNswU91R91IYg7t3SZKF/t80MOlyIJAV54RJVyn4
	 WJ/t5jJO53LwXEuDgWKjMo0RzicFfz44FcMfVKQkp85TeMCNjW8IeBhK1GyDxQNgvA
	 H5cMEOqEfNCIA==
Date: Thu, 23 Jul 2026 14:37:11 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>,
	mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] fpga: m10bmc-sec: add image_load sysfs for N3000
 and D5005
Message-ID: <20260723133711.GM3363113@google.com>
References: <20260715073854.26117-1-ionut.nechita@windriver.com>
 <20260715073854.26117-2-ionut.nechita@windriver.com>
 <20260715075504.3B2FB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715075504.3B2FB1F000E9@smtp.kernel.org>

On Wed, 15 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Lack of synchronization in the `image_load` sysfs handler allows concurrent firmware reloads and races with ongoing secure firmware uploads.
> - [Medium] The 'control' sysfs group creates an empty directory even when the device does not support image loading, failing to completely hide the group.
> - [Low] The image load handler arrays and their pointer in `m10bmc_sec_ops` are not declared as `const`, storing function pointers in mutable memory.

Please show that you have at least considered these, or better mitigated them.

> --
> 
> --- Patch [1]: [PATCH v1 1/1] fpga: m10bmc-sec: add image_load sysfs for N3000 and D5005 ---
> commit d97d9214f834756bd204bc187982a995a0b7658d
> Author: Ionut Nechita <ionut.nechita@windriver.com>
> 
> fpga: m10bmc-sec: add image_load sysfs for N3000 and D5005
> 
> This commit adds the control/available_images and control/image_load
> sysfs attributes to trigger a reload of a BMC or PKVL retimer firmware
> image. It handles device-specific configuration for N3000 and D5005 cards.
> The control group is intended to be hidden when not supported.
> 
> > diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
> > index 7d23d914df3f2..7a390cd705161 100644
> > --- a/drivers/fpga/intel-m10-bmc-sec-update.c
> > +++ b/drivers/fpga/intel-m10-bmc-sec-update.c
> > @@ -15,8 +15,14 @@
> >  
> >  struct m10bmc_sec;
> >  
> > +struct image_load {
> > +	const char *name;
> > +	int (*load_image)(struct m10bmc_sec *sec);
> > +};
> > +
> >  struct m10bmc_sec_ops {
> >  	int (*rsu_status)(struct m10bmc_sec *sec);
> > +	struct image_load *image_load;		/* terminated with { } member */
> 
> [Severity: Low]
> Should this pointer be declared as const struct image_load * to ensure the
> function pointers remain in read-only memory?
> 
> >  };
> 
> [ ... ]
> 
> > +static struct image_load n3000_image_load_hndlrs[] = {
> > +	{
> > +		.name = "bmc_factory",
> > +		.load_image = m10bmc_sec_bmc_image_load_1,
> > +	},
> > +	{
> > +		.name = "bmc_user",
> > +		.load_image = m10bmc_sec_bmc_image_load_0,
> > +	},
> > +	{
> > +		.name = "retimer_fw",
> > +		.load_image = m10bmc_sec_retimer_eeprom_load,
> > +	},
> > +	{}
> > +};
> > +
> > +static struct image_load d5005_image_load_hndlrs[] = {
> > +	{
> > +		.name = "bmc_factory",
> > +		.load_image = m10bmc_sec_bmc_image_load_0,
> > +	},
> > +	{
> > +		.name = "bmc_user",
> > +		.load_image = m10bmc_sec_bmc_image_load_1,
> > +	},
> > +	{}
> > +};
> 
> [Severity: Low]
> Would it be better to mark these arrays as const? Placing executable
> function targets in mutable memory increases the kernel's attack surface.
> 
> [ ... ]
> 
> > +static ssize_t image_load_store(struct device *dev,
> > +				struct device_attribute *attr,
> > +				const char *buf, size_t count)
> > +{
> > +	struct m10bmc_sec *sec = dev_get_drvdata(dev);
> > +	const struct image_load *hndlr;
> > +	int ret = -EINVAL;
> > +
> > +	for (hndlr = sec->ops->image_load; hndlr->name; hndlr++) {
> > +		if (sysfs_streq(buf, hndlr->name)) {
> > +			ret = hndlr->load_image(sec);
> > +			break;
> > +		}
> > +	}
> > +
> > +	return ret ? : count;
> > +}
> > +static DEVICE_ATTR_WO(image_load);
> 
> [Severity: High]
> Does this sysfs handler need synchronization (such as acquiring bmcfw_lock)?
> 
> Without driver-level locking, concurrent writes to the image_load attribute
> could cause multi-step hardware operations to race. This might also race
> with ongoing secure firmware uploads in the background.
> 
> For example, m10bmc_sec_retimer_eeprom_load() performs a check-then-act
> sequence:
> 
> m10bmc_sec_retimer_eeprom_load()
>     retimer_check_idle(sec);
>     trigger_retimer_eeprom_load(sec);
>     poll_retimer_eeprom_load_done(sec);
> 
> Could concurrent executions silently corrupt the hardware doorbell state?
> 
> > +
> > +static umode_t
> > +m10bmc_control_visible(struct kobject *kobj, struct attribute *attr, int n)
> > +{
> > +	struct m10bmc_sec *sec = dev_get_drvdata(kobj_to_dev(kobj));
> > +
> > +	if (!sec->ops->image_load)
> > +		return 0;
> > +
> > +	return attr->mode;
> > +}
> 
> [Severity: Medium]
> The commit message states the control group is hidden for the N6000:
> "The control group is hidden via its is_visible() callback whenever the
> device ops do not provide an image_load table, so N6000 ... is unaffected."
> 
> However, does returning 0 here actually hide the group directory?
> 
> As per the sysfs API, returning 0 for a named group only suppresses its
> internal attributes, leaving an empty directory visible. Should this
> return SYSFS_GROUP_INVISIBLE to completely hide the control/ directory?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715073854.26117-2-ionut.nechita@windriver.com?part=1

-- 
Lee Jones
