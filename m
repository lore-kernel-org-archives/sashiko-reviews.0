Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079285;
	b=t37TyrIBGtOewVqHnJQoljzk2QQeauCiqS/2OHFp97vpL2GALS2z/PkiS6Cx3iri+Mq8
	 +kwSXkjXRpKgt2hu6qQbK8tlwjhYRtmYr1eEPaL2wUK6BbSGWZsy4XqSqj+uujEMBQa4I
	 CeEO/W3S/FNHrznYSWJj9Gvq7Ijqp1wsMqKYFsMByo1LhoZFbWNOC7Whi4gOh4Jj03BG+
	 /mVCljGjC3dFzH33ZwEUqkgtLRiFD+b916c+yPzop7I9kRtPi6YXxAM3lXw3JMHyQRZwo
	 ywiDkF0oZveILBkdAohzG8zUHaObo1oXwAjpajVTolIX3m5RJfZk46I20zOpGT7pRFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079285;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=O9R7egJCPlZLZP73GLSxT/6A7uKiquUS5zEC8ZPt3xA=;
	b=TTPR4AUtPweSQH+rAechUUpLKVSiM72ur8OR3gwih9DRBoxHubmkN7akA7jN0ZnPzsUG
	 HvQPwyZfmmORdQqF2zngjpKoKE9UyOjSrpVTjVXCuDt0MgFula3aX3yTuGElhhIGBu2lj
	 noA+lv7whQNNOEW/pdyVe484GekEijWI772H4sC6UT2ZrZS04pq7KhDJii+LOwi3xEbEv
	 koGJ6JCDTPsUe2c3ssMPMgpm7Lflntt8/V0/Y+lGC37IlsA9o3PfffAUIhICm1WYooXHK
	 C1RCKr/xbB1A5LS8cocucNUyow+6E/GQcn44NqSrKcZmdZC370rRWXyjCiPNVeFFxHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWdcA0f0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C29606A320;
	Thu, 19 Nov 2026 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oWdcA0f0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCD11F000C4;
	Thu, 19 Nov 2026 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795079285;
	bh=O9R7egJCPlZLZP73GLSxT/6A7uKiquUS5zEC8ZPt3xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oWdcA0f0pLO1l15XvAygqm6EZn0GKHryD664ghnP18cFakbX7k6edMCrDZHumecb5
	 BRx2MKrpHujVK6qvk3CGcGXyr0RojYMzamIRdGhyBPMcN80Rt+Qnnff9p2ybqKOeDo
	 g4R1r7VuYUfPm6wW2r7bYH7WI/PBNBoswE9R0tGak4bRsES1YDkNQEGcsTzrKxQJ2b
	 soB/v3b40AplwbcUHqZoW4dueLsUO+kTu8g5wu2TBB/1pd1eK0UWRtH0Kwt+lxH3Ut
	 p3trHGiWhlEwMjSVSodmq6g4m9m7DwX6zi42ko2XGZJkYl7lEL8yiWCDMFrpboQxhw
	 IT88AORPBJejA==
Date: Thu, 19 Nov 2026 09:08:01 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>, mfd@lists.linux.dev
Subject: Re: [PATCH] mfd: stmpe: Disable regulators on probe failure
Message-ID: <20261119090801.GL98456@joneslee-macbookpro.roam.internal>
References: <1795076100902-8-fa247961@mail.zgclab.edu.cn>
 <sashiko-outbox-222667@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-222667@kernel.org>

On Thu, 19 Nov 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] mfd: stmpe: double regulator_disable() on unbind with
>   stmpe_remove()
> - [Medium] mfd: stmpe: unbalanced regulator_disable() when
>   regulator_enable() fails
> - [Low] mfd: stmpe: misplaced comment above stmpe_disable_regulators()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] mfd: stmpe: use-after-free and virq leak in stmpe_remove()
>   [1]
> --

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> commit bf0f4e286fa2ad07c0c3a3f5f83cd68ff2fe5396
> Author: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
> 
> mfd: stmpe: Disable regulators on probe failure
> 
> This commit registers a devm action in stmpe_probe() to disable the vcc and
> vio regulators when probing fails or the device is unbound.
> 
> > diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> > index 879124de912d8..f0924556d5c2f 100644
> > --- a/drivers/mfd/stmpe.c
> > +++ b/drivers/mfd/stmpe.c
> > @@ -1363,6 +1363,16 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
> >  }
> >  
> >  /* Called from client specific probe routines */
> > +static void stmpe_disable_regulators(void *data)
> 
> [Severity: Low]
> This isn't a bug, but inserting stmpe_disable_regulators() here separates the
> "Called from client specific probe routines" comment from stmpe_probe().
> 
> > +{
> > +	struct stmpe *stmpe = data;
> > +
> > +	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
> > +		regulator_disable(stmpe->vio);
> > +	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
> > +		regulator_disable(stmpe->vcc);
> > +}
> 
> [Severity: Medium]
> Can this disable stmpe->vio and stmpe->vcc a second time on unbind?
> 
> stmpe_remove() still runs before devres release and disables both supplies:
> 
> drivers/mfd/stmpe.c:stmpe_remove() {
> 	...
> 	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
> 		regulator_disable(stmpe->vio);
> 	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
> 		regulator_disable(stmpe->vcc);
> }
> 
> regulator_is_enabled() queries the underlying regulator_dev state rather than
> this consumer handle's enable_count.  If either rail stays on after
> stmpe_remove() (for example, an always-on regulator, a shared rail, or a fixed
> regulator without an enable GPIO), stmpe_disable_regulators() calls
> regulator_disable() again with enable_count == 0 and triggers the unbalanced
> disable WARN in _regulator_disable().
> 
> >  
> >  int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
> >  {
> >  	struct stmpe_platform_data *pdata;
> > @@ -1417,6 +1427,11 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
> >  		if (ret)
> >  			dev_warn(ci->dev, "failed to enable VIO supply\n");
> >  	}
> > +
> > +	ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulators, stmpe);
> > +	if (ret)
> > +		return ret;
> 
> [Severity: Medium]
> Can stmpe_disable_regulators() also call regulator_disable() on a supply whose
> regulator_enable() failed?
> 
> When regulator_enable() fails for stmpe->vcc or stmpe->vio in stmpe_probe(),
> it only logs dev_warn() and leaves a valid regulator pointer with
> enable_count == 0.  If regulator_is_enabled() returns non-zero during error
> unwind or unbind (for example, when another consumer keeps the rail enabled or
> ops->is_enabled() returns a negative error code), stmpe_disable_regulators()
> calls regulator_disable() on the unenabled handle and triggers a WARN in
> _regulator_disable().
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but stmpe_remove() [1]
> removes stmpe->domain and disables the regulators while stmpe->irq is still
> active, and leaks the child virtual IRQs mapped on stmpe->domain.
> 
> stmpe_probe() requests stmpe->irq via devm_request_threaded_irq(), so
> stmpe_irq() remains enabled until devres release runs after stmpe_remove()
> returns:
> 
> CPU0                              CPU1
> stmpe_remove()
>   mfd_remove_devices(stmpe->dev)
>   irq_domain_remove(stmpe->domain)
>                                   stmpe_irq()
>                                     irq_find_mapping(stmpe->domain, ...)
>                                       <-- use-after-free
> 
> In addition, mfd_add_device() creates virtual IRQ mappings on stmpe->domain via
> irq_create_mapping(), but neither mfd_remove_devices() nor stmpe_remove()
> calls irq_dispose_mapping() before irq_domain_remove().  That leaks the
> allocated irq_desc entries in sparse_irqs with dangling irq_data->domain and
> irq_data->chip_data pointers to the freed irq_domain and struct stmpe.
> 
> [1] https://sashiko.dev/#/bug/linux-aaf90163-a755-407e-aec5-73a7ef05da1e
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/1795076100902-8-fa247961@mail.zgclab.edu.cn?part=1

-- 
Lee Jones
