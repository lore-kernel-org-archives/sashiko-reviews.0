Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3640130C179
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785400620; cv=none; b=r7xJK06YV4jRZP/w5AZDDxYXETi5yGCAITlMhCxRwCh0rXhjczlMMuANmn1vM0Za33AjmSEAmEQk6NRhtHE9iSRqDKQ7wswSdJYAAk+FenpoRkTn8Fgff2spRBqRIV1ekEoWbm++Lhtcie/Tm0G8SIMjsZURYp570rJhWfBQz/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785400620; c=relaxed/simple;
	bh=ldWeQqgVGENPbiJuTTfJy3Ypb6F9mvW5Q7qKkHhULXY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9e0MXsN1o8qD81mwsVw52mSsFpAusCuY9lj8/Z3ovhw+bQCc4JoDuZjNy1TX4utLVZGvS+QeCeHItgwFrfzIpZ0ZZAyiLFsGCWZCdEdltjGMfreOyOjQmecNW/UQ6xoulmIarefE/IimYOIkDOSvLCCk1z3XmisUhA2wfeH4eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KsMSDNfR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsMSDNfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785400618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BJTv0GnfJX61s9kcSSNJonT/FIIHCaZ/xJUeqJ7IGYU=;
	b=KsMSDNfRGzy+HuUNRvsN6sbh/hue+usUNDsHdtM6ZIf1BIaNnCaDi9kGTleTazWJjENSlN
	egSofH8JNjWMyoF1pwt42JdLAzEqGgehWJPqHEy8IXr45in6WtwX4PiL6rrBD4ZR4jeVuk
	Kg669HckUWIHSyhj5w08cX36OE/qKYo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-3HHjZ_Y6N5-3tfdd6HzVjg-1; Thu, 30 Jul 2026 04:36:56 -0400
X-MC-Unique: 3HHjZ_Y6N5-3tfdd6HzVjg-1
X-Mimecast-MFC-AGG-ID: 3HHjZ_Y6N5-3tfdd6HzVjg_1785400616
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930f5da3467so219484085a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 01:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785400616; x=1786005416;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJTv0GnfJX61s9kcSSNJonT/FIIHCaZ/xJUeqJ7IGYU=;
        b=dWsc04p+rht/SFCU4z/sNZCJYFo+1JfyiXihm+NLaUCE9mtWRwkLu4Dwlazu0VnldK
         FxJycwmxH4nQZXVvti+PZdOz6NErgUwEVDqEJxmgcPhZ2JRX9abZMmpFSV/5fRSSenNS
         +zLigSGMDCGgZIy6sCj38y/unsMx4qtSlcVJS6zGfx6ksbFe0qpmt+yQwdNTJbrzuK33
         vLfy9UiioD2VKKjD2hBwQ8p5LoCtpnrSjF/QqOkqJrCNgk595cHK7rrQxftUuKT1avkd
         qfvvoHMOCqPPtPZK97joxGPJfPA6bPiBRGss8k6niWCeSo7ue5xtOvCPBc0j62rMTf01
         KYJw==
X-Gm-Message-State: AOJu0YzoFRe6dNxXCFUp59Ifi22LX5PRy2jLPhW4+90gm/SykefcpqYf
	MLxYO/+MRsev/ULlV4b29zTptTeBYORs+eQ0v81SByyAAudmmMA9PSOxogmf8SBLjBC0C56e2Gw
	GTpWqmbPY2ZjRoGo8OMlvBkJ07hftFwv1MTMt3TxCEXHku4EG/ixzmtkDfOS9Cfy+9z39aHT0g3
	apqC9uV227k6QGc2oNW0/xUyGCxxN+44ytQcQb+CEHsAXTH+oyFwR5
X-Gm-Gg: AR+sD12DJakKRiO0oi/fFYJMgFjg5zgg7eyhi5FbzCwpLeiO7XgQyeY3H4qqqme37P2
	xH0AHiVVR6rxqyorCTmiKJZXYaq096vh5xZPHD8yJ7jCFpTkEI/Zaw7NX2RCpc2crPErMGeUoh4
	217vHRwAS+BlyDQOVtKZpUOeMtu29RBrmnSqmU1oprQ+jlHDv/wWBOBAY=
X-Received: by 2002:a05:620a:a2cc:10b0:92e:ff34:17fa with SMTP id af79cd13be357-934872091femr118058685a.84.1785400615747;
        Thu, 30 Jul 2026 01:36:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cc:10b0:92e:ff34:17fa with SMTP id
 af79cd13be357-934872091femr118057885a.84.1785400615370; Thu, 30 Jul 2026
 01:36:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:36:52 -0400
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:36:52 -0400
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20260729171747.CF28E1F000E9@smtp.kernel.org>
References: <20260729014223.17937-1-slp@redhat.com> <20260729171747.CF28E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 04:36:52 -0400
X-Gm-Features: AUfX_mwWn6FM8OQ5T3rWsg7bRWtcRdi_hoypiqsqKjNmYcBnvUPorGF-Sbs2aLI
Message-ID: <CAAiTLFVTN-KWF3hzPxB-RR6SuLF+9JAWbrLA2um7ZkgXUcdxAw@mail.gmail.com>
Subject: Re: [PATCH] KVM: have hva_to_pfn_remapped write-upgrade PTEs
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CVjOmTbkxNiDBgtFwjx84y4LCsKxAeDX0Lc5W9LQ0U4_1785400616
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Incomplete fix for VM_PFNMAP write-upgrades, bypassing already-populated read-only PTEs
> --
>
> --- Patch [1]: [PATCH] KVM: have hva_to_pfn_remapped write-upgrade PTEs ---
> commit 8ea7b308a68b0aabea9b703efac8ec9af51170aa
> Author: Sergio Lopez <slp@redhat.com>
> Subject: KVM: have hva_to_pfn_remapped write-upgrade PTEs
>
> This patch introduces a second fixup_user_fault call to handle
> write-upgrades for VM_PFNMAP mappings that install read-only PTEs on
> write faults (such as DRM GEM BOs).
>
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index b4baa69a55402..b7fb9278f198b 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -2958,6 +2958,8 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> [ ... ]
>>  	r = follow_pfnmap_start(&args);
>>  	if (r) {
>>  		/*
>>  		 * get_user_pages fails for VM_IO and VM_PFNMAP vmas and does
>>  		 * not call the fault handler, so do it here.
>>  		 */
>>  		bool unlocked = false;
>> +		bool write_upgrade = false;
>> +do_write_upgrade:
>>  		r = fixup_user_fault(current->mm, kfp->hva,
>>  				     (write_fault ? FAULT_FLAG_WRITE : 0),
>>  				     &unlocked);
>> @@ -2969,6 +2971,17 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>>  		r = follow_pfnmap_start(&args);
>>  		if (r)
>>  			return r;
>> +
>> +		if (write_fault && !args.writable && !write_upgrade) {
>> +			/*
>> +			 * VM_PFNMAP fault handlers may install read-only PTEs
>> +			 * via vmf_insert_pfn(), deferring the write upgrade to
>> +			 * a second fault. Trigger that upgrade now.
>> +			 */
>> +			write_upgrade = true;
>> +			follow_pfnmap_end(&args);
>> +			goto do_write_upgrade;
>> +		}
>>  	}
>>
>>  	if (write_fault && !args.writable) {
>         ^^^^
>
> [Severity: High]
> This is a pre-existing issue, but does this placement miss the case where
> the PTE is already populated but read-only?
>
> If a guest first reads from the DRM GEM BO, triggering a read fault, the
> DRM GEM fault handler installs a read-only PTE. If the guest later attempts
> to write to the same page, hva_to_pfn_remapped() calls follow_pfnmap_start(),
> which finds the read-only PTE and returns 0 (success).
>
> Since r == 0, the entire if (r) block containing the new write upgrade logic
> is bypassed. The code then reaches this check and incorrectly returns
> KVM_PFN_ERR_RO_FAULT instead of performing the write upgrade.
>
> Should the upgrade logic be placed outside of the if (r) block so it can also
> handle already-populated read-only PTEs?

Yes, I've confirmed this scenario is possible. I'll send a v2.

Thanks,
Sergio.

