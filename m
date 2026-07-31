Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D75645A29B
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516099; cv=none; b=kwSbBnnm7I2XQWP/n9ym0IbbH+z8V0zW28GnghCdxyGpEQofkZMD4AzVpQMz0lStrPvJR5ujeftehAwYUk9IcDEwnlHcxAVhd8SMvVLj24eUXSFztHj+Wa9QVLtzhwVPS2yKfU70BAUZfp/T/zNuYQ6z96zoueQEI/GVErcw3O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516099; c=relaxed/simple;
	bh=F9xZYVz4ZEkB/YY1VXAwOyBTHT4hbBho8L47fEJ29BU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSUf0MMxpjv0ybkWOzu79/GUHcRd/NyOFN1EV7rNz0tcl57X663C1wVDgI+fkQ1Kg3+1NseaV+/+DOabdrcoNfExNYg5VAaiosSZegNgUElb07soMAlk75TLtmguNvgonWTa5gFAnPFOPI2qzE2pZtIlnS5Q/LPzR6OcQqLsHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJp120P3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJp120P3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785516096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UHIITFZPqPQFJOriq8QiSbWl+sX2qBlUH+qmqlgn/Y=;
	b=VJp120P3CYTqKyfOtbsCca4G75pxy54yuMnknUWvSMxDWbePz1CPOlBfEXQp63md2zwNYk
	Vyq3Ai6dehAkyAYsxrIG/NIsO6k/QzvHIpqiPAhpqnxVvsPwWxZ8Jv3EuCh+t1Vwz2ZUwt
	YuUT6C9XRL3e20hJRVjW108NXKLrJPs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-AoU0pvucMSuKOs9oJi2mDg-1; Fri, 31 Jul 2026 12:41:35 -0400
X-MC-Unique: AoU0pvucMSuKOs9oJi2mDg-1
X-Mimecast-MFC-AGG-ID: AoU0pvucMSuKOs9oJi2mDg_1785516094
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f83a59e5aso1677354f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 09:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516094; x=1786120894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UHIITFZPqPQFJOriq8QiSbWl+sX2qBlUH+qmqlgn/Y=;
        b=tLd/r7ONY/J6c3vcFcwGPVx1LzQtlAR060wP5dttX1DJCQJHRaHtKJbD1UhSR5NOAt
         IECW9G29QutNSj3IDCeoj1lt2pL3seZf4iXdDqoE9d/ITNXKlB9/ejvZP/VmyCJmT0Sa
         522N7QZATv3EtX8B3jAM/6OKH12B5I4CC5xZSLxsOWDQ7X6FNvSM+xQgxyg7Xri6WHj0
         Ro3gx2ZC0XQzkqBzuo84FfVsaDbfoTR5Q3xlx6dlic/4GqcpQ5nUWCHyVhkjGBiQJpc1
         16ix6AUcZR3XF2Koa5NFEcV0GrVso8yS/7OJ8lo4JkfY5a0X8lkZpgw42lrkK57KoYLf
         H0Ng==
X-Gm-Message-State: AOJu0Yz1IXE+czfKF2YGC//XCaCqF7WLxcdlhJJmVBFht6kd1votZaDz
	NvRuIFqlZRccfj2mFbmB+gZY0QUAXORI5S6o7/lrqMVPn+A7loax1p4Hv97ZS0rhHet8FePxSu0
	WhH2NQk4fQfQ+bGDdOmifDa3fR1xBFW6U9DXrtot78woAEQm0Hzm5c8sNegmqNxCj+76ud8MM4L
	m6X7xL2TQbMOfYxe4kEbjvdTW5e9g1E67FMMj5sV+Z8SpsPlRwusN+VzM=
X-Gm-Gg: AR+sD13HQofZrTZPxIdnPtiRrL6JQW13nYWFOdvbvhSnaiRMpAmjqdRSxLznzuNbiKk
	Gwa1FmO9wBpFbwm3Uks6S8QquPJqtd/elz+Ii7eYvTUkAKPgWCjvi9v8wvQX9erCtm4Tq3W5Ijs
	zab7gZLn6Gs+yHLxecylo8pVpAfUPhd4Y4/gNRhrBCcSNy8Ku1GhgETT2TV9v6jBKpIsnIYY2gd
	jB+BawaR0Yvbe/C7cI4yowBlXVoB+IWcxHc/kT1oZZNK4Qy2zbPieVe27U=
X-Received: by 2002:a05:6000:25f3:b0:47f:6fa4:58e0 with SMTP id ffacd0b85a97d-47fd72f15a4mr665693f8f.35.1785516093953;
        Fri, 31 Jul 2026 09:41:33 -0700 (PDT)
X-Received: by 2002:a05:6000:25f3:b0:47f:6fa4:58e0 with SMTP id
 ffacd0b85a97d-47fd72f15a4mr665651f8f.35.1785516093659; Fri, 31 Jul 2026
 09:41:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731160514.1101989-1-pbonzini@redhat.com> <20260731162036.1FA1C1F00AC4@smtp.kernel.org>
In-Reply-To: <20260731162036.1FA1C1F00AC4@smtp.kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 31 Jul 2026 18:41:21 +0200
X-Gm-Features: AUfX_mwboGSq7mPSFXQ7e5KxQ3OYwhupahjJ5-r1wrcYmDVpP3Nemd0IWm0sYoM
Message-ID: <CABgObfbkqYNsPQnKxK1_4adXF_tSdtScPU5-Xrg-sXyeWfMVfQ@mail.gmail.com>
Subject: Re: [PATCH] mm: pull writability check to follow_pfnmap_start()
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H2_ibQ7lJb5Fe04T-vphnAFyv8jyr4_N_hsyOeJQYFE_1785516094
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 6:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] KVM fails to return KVM_PFN_ERR_RO_FAULT on write faults to read=
-only PFNMAP VMAs, breaking MMIO emulation.

Let's look at the bright side, I only messed up the part that *I* maintain.

Yeah this is correct and fixed with something like:

    /*
     * A write to a VMA that isn't writable can never be fixed up, as
     * fixup_user_fault() rejects it outright; report it without even
     * trying follow_pfnmap_start().
     */
    if (args.write_fault && !(vma->vm_flags & VM_WRITE)) {
        *p_pfn =3D KVM_PFN_ERR_RO_FAULT;
        return 0;
    }

before the first

     r =3D follow_pfnmap_start(&args);

Paolo

