Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980125A2DD
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 22:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782255579; cv=pass; b=YxSerzLAFm6ZzYA1m8kx96ING+JiBlWdUo+Z43aGxfQrCjpKW/lmrl9GT9NStJUFjLAk28+qGaX4Dev7jYY/TLNqRL7h5JQwDspmyOvCvQZU4F5jtFWlSz5HqgYZsg409fwD8LPH+JOj6X++t2Fz+/xqB34WYaICC2rHgUE8NmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782255579; c=relaxed/simple;
	bh=ALTZ47oOWuTk6jwVK2wVYlpGsSF6SwRn/hzyElvW4/w=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=H7qxSfLM2kHJokNB4L572gVS6+oneWsYpAiuYk46ln/LG1bfFDkBPv0vIkicmJAL1pypaQQdajH9n34O4p68KSL+OTPfIzTPBbOaxo6LEzJYoVQJiFmr6E/+9cTyRDcCK1YT4SpGwRRpzX0tlMcwGvHLD0rov+dA+Y0CplTAbBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=F4Me0aLg; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="F4Me0aLg"
ARC-Seal: i=1; a=rsa-sha256; t=1782255574; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nXd2cefmCsFgzsyi0RbZNTnf+yE4Q87SVxIYsvSnWPkFdlI0PDaU9qK9xIGz7/jzjoXhCan6ieIzUkXsCF69EbuC5XklRmFvJghnS2RIe2/KPAVmnxO9qtUVj5Tu663+jdvtoEMiCg7cN7UkFt1ybNktO02kZy9gWRtsPqjtUtg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782255574; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c0wGNnooojHO6EZMXEvgSeh3xgTaCfJV9xX12zEhQjU=; 
	b=VkVTJoShBdFMo6J30SFJRf23K3wZwUF3JqMQx903UdvG4mwzBcD9PpdSgyvoNF5Pn2J5FUjARTCz88NV26Jqxrhya34cNVHWJhzpTYufxUqNPba7qEfyhHlovCHQFgZLJOdJvqLjNKtgmpL1IjaRcY1utZefbpPDJlCEu9/zFt0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782255574;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Date:Date:Message-Id:Message-Id:Reply-To;
	bh=c0wGNnooojHO6EZMXEvgSeh3xgTaCfJV9xX12zEhQjU=;
	b=F4Me0aLgIEWe1iVOPVzigmXKrCIFpSJ0k+q8MPb62WHfyWezWNE9e6cq5hoaUXCE
	r7UdxWnBM9RmWnWaSYbCwdLpkYSohESVU0TpDtii6Tkgj1OtauoY5adwky80bKwrSH7
	thdL3bbuLr7VSqc3Bf6mTwdoqQBkGUnrp0sCBAwQ=
Received: by mx.zohomail.com with SMTPS id 1782255573447441.3883527646757;
	Tue, 23 Jun 2026 15:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] drm/panthor: Add vm_bind region with kbo range
 overlap check
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
To: sashiko-reviews@lists.linux.dev
Cc: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20260623204220.CDB1B1F000E9@smtp.kernel.org>
References: <20260619-vm_bind_checks-v2-0-b51abab35f71@collabora.com>
 <20260619-vm_bind_checks-v2-1-b51abab35f71@collabora.com>
 <20260623204220.CDB1B1F000E9@smtp.kernel.org>
Date: Tue, 23 Jun 2026 23:59:23 +0100
Message-Id: <178225556310.3577656.2856555661328160254.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3569;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=ALTZ47oOWuTk6jwVK2wVYlpGsSF6SwRn/hzyElvW4/w=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBqOw/UBiQHTKOCnbqrgsMk5OPTLexljn8SfDzMu
 IpnIC442PuJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCajsP1AAKCRAOJn5M7lND
 PZnZDACSD4lKU6wP+r+xfea6/XFcAOiEbuFuxmHf7dJsuCjeQxnkIpluZvu6ahcgonak3/Bor7r
 g7n97fB3w54ytAr7wh9O8YpU31AU86DY6b/FhAtR8qKmaHH2Y+JBE0soafVsnF6mOZwygPWSCSS
 guAeIIEzWJaAD5DraScdQrH0QrWQpKR/c+1sFWzKSxZ+VXC/ANwfpeoVgiPs5qeNTiqj4oKIrbP
 oof0ZqFdzZJ+J1gkOYEaBjdbsVRfDUgtbIsY2pjQ8MMownFRn5p6EXIb7A5MnTQSqmtqquwD6Y4
 9lL71Sk7J1blD2Fm0rwpQqHuA2EUfOQVV2qZwABIcKZ8GY5BOfPF9f9NVYubNhKeKiNTHmEyd+8
 fKbPJNCTxlYbwAnodwqZ2JNf+PAN09kmmh/VdRuzYoH/ugB6dKSmO4tTGbiPOEWhvaPYYYESZVi
 67278VBSilJoreOg/5RRxMCcNkR2yUQ8cvLcevGoCp3fsRulfDfXshRmtYIrwfwLqP1Vw=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

On 2026-06-23 20:42:20+00:00, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] The overlap check incorrectly rejects valid user VA mappings that end exactly at the upper boundary of the user VA space, effectively reducing the usable user VA space by one page.
> 
> Pre-existing issues:
> - [High] The bounds check for the kernel-reserved VA range lacks integer overflow protection, allowing an attacker to bypass it and trigger undefined behavior and hardware register corruption.
> --
> 
> commit 544d7f2ab2018dcefc4327336a2da6f6a37e4d4f
> Author: Adrián Larumbe <adrian.larumbe@collabora.com>
> 
> drm/panthor: Add vm_bind region with kbo range overlap check
> 
> This patch adds a check to ensure that user VM mappings do not overlap
> with the kernel BO address space carve-out. It sets a boundary for the
> user VA range at VM creation and enforces it during the vm_bind ioctl.
> 
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 31cc57029c12c..a8de4fe6b231b 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> 
> [ ... ]
> 
> > @@ -2893,6 +2896,8 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
> >  		va_range = full_va_range;
> >  	}
> >  
> > +	vm->user_va_end = kernel_va_start - 1;
> > +
> >  	mutex_init(&vm->mm_lock);
> 
> [ ... ]
> 
> > @@ -2981,6 +2986,10 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
> >  	if (!IS_ALIGNED(op->va | op->size | op->bo_offset, vm_pgsz))
> >  		return -EINVAL;
> >  
> > +	/* We don't allow mappings that overlap with kbo's reserved range */
> > +	if (op->va + op->size > vm->user_va_end)
> > +		return -EINVAL;
> 
> [Severity: Medium]
> Since op->va + op->size represents the exclusive end of the mapping, and
> vm->user_va_end is the inclusive upper bound (kernel_va_start - 1), does this
> reject valid mappings that end exactly at the boundary?
> 
> If a mapping ends exactly at kernel_va_start, op->va + op->size will be equal
> to kernel_va_start. The condition kernel_va_start > kernel_va_start - 1 will
> evaluate to true and return -EINVAL, effectively reducing the usable user VA
> space by one page.

Looks like a boundary condition, I guess testing like

	if (op->va + op->size - 1> vm->user_va_end)
		return -EINVAL;

should be enough.



> [Severity: High]
> This isn't a bug introduced by this patch, but is it possible for this bounds
> check to be bypassed due to integer overflow?
> 
> If an unprivileged user calls the vm_bind ioctl with a sparse mapping and
> parameters that overflow when added (for example, va = 0x200000 and
> size = 0xffffffffffe00000), the wrapped va + size evaluates to 0. This
> successfully bypasses the new check.
> 
> Later in the execution path, this bypass triggers undefined behavior when
> pack_region_range() calculates region_end = start + size, which wraps to 0.
> This makes region_end - 1 equal to -1 (0xffffffffffffffff). The call to
> fls64(*region_start ^ (region_end - 1)) then evaluates to 64, leading to
> region_width = 63 and a shift by 64 (1ull << 64), which is undefined
> behavior in C and corrupts the lockaddr hardware register.

I don't think this is relevant as an existing issue because
panthor_vm_prepare_map_op_ctx() will clamp the size to bo->base.size.
However, we must still check for overflow in the sparse binding case.
