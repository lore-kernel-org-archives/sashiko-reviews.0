Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BB734FF62
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787545677; cv=pass; b=BItpSFyQjD3iBQpoA7+QV/0Snkymdyu8Kw4kC+RquHTInRoTNbCHWkE6aDM0Gh9rYUS2rL2EbOjXFxmommR4ona9PrRHFpP4fDmm9QW1ic6ysior40tPW72R7dV7BVtT62xyKFCVU/gQ4yCJxmtxNp4m8+WEW0y2y/S/Fbu967k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787545677; c=relaxed/simple;
	bh=hT0QUt5H542PT0X7fGha+PvX663QHj3aTFMv5sI+ia0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYUoPoRyiS4/tlXErdgblT8fR0ef93gZEkdC80g6SVwXKl3aC5ZniMkTUZ2r/Z8kpAqjytTFOKAzmv1FhEuraDIr6VK456aLCFNdw94XvsSmnwq8Kw1bwPk6iiySgVhio2ALDmyIB0GJXSawlp2DnnNnjOIJxBPyLAtmL8o9S6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OCJTaz9O; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OCJTaz9O"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-9061a795d76so32588796d6.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 21:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787545674; cv=none;
        d=google.com; s=arc-20260327;
        b=kUVDFZUK+6Ga2+BDG6PL/3tq5YE6Jx7ZFrhRKqZXe6B26kc/MbaLVWzXle0zHKBhoC
         5zixq3HLlSu3y67wSUehG44mvN6wibVgWMo7dRCB1Dz/bmFec0VKmxTcJ5NXX/pb+aVz
         r3Pgy5vwH5lDgMF/1tC9HfjEIXYdwBJwlP8rkwcvcc7Zey4DoVjTpaHlT3jbXXN9wtkK
         lrdr5lAOFqkyHQcEPkcMoIdeuplzuOUWq3+CxfM7P6TrqR3l8s0T3gxzjtrzOW3eQfNB
         drcP8WQzeEZycwqz2n09CIJSb2zWTLTAW3PBOUR9ceelbCzEfi7pzWxK3QBi4ZmWkEt1
         ozEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Ow00I9KGY7fZXYsA63TM5zImzlELrKld0vpQu6AI6z8=;
        fh=nOJSOoAFnfBk9KDG0cYVqM6p7pcLeHX5vu/33Yc0CfA=;
        b=KysRlIYItURpuh4SVWKtytoqoktr/CJzLz3DAVx4jP8lHzANrf/lfpYulKpsKp5STO
         K/u9BW8Iswrl+vSMH9IhzYUK++e+fUVX4FZ/jnm/+MMfxfGadFJgX9ZCYiuUsRyhIoCW
         ucQwD2J+BTSxtWvZlvm1otNBsmkq8jrNbZ+1mTopHTUAdzI7G7OWFbGPV5kvmrmq0Ln5
         RjFxvjVxtxv7nT3TAbYa0OTlJLNntw0Sz8MejkF29c9dIA9dZZeZ28NTyLhSfR/XO+pY
         EIOFceGPqbuKefwKuTxx5C+UrAg8wS6HZe9E2YY7JZqfEhkzn6rT7blmVrTv/hNzLO5C
         uYuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787545674; x=1788150474; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ow00I9KGY7fZXYsA63TM5zImzlELrKld0vpQu6AI6z8=;
        b=OCJTaz9OvVfGt5ZI6YmKldO/V6ltx09h27h8b0c3AtBZa3pT6qLNXgkoUSAuKCQH8G
         saq/3gZubNkV3tsp2nvysSt2HZpBfOCRGs+NG51VYvxebE1OSUZezo+eiZw6zndmd20l
         aE7KH0Vw67CHnLyQQH0cKrhVQxxio6hJexDeg2RitDuJzFWG6qeW2Ovge59Q2sv/xRiE
         IW2Iur5U+TK/85X7Qcb/eWw/ZkBPWy+sLk50SSRg9yF5Xd6xVtmEtJqh5ELPesPs889x
         LNvRNMnKICgolFXb6gGFD/Ji1tsg8o5owTKuqRZ/sW5cwgjKUxToQr3RCc4Ql/onbt8B
         bfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787545674; x=1788150474;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ow00I9KGY7fZXYsA63TM5zImzlELrKld0vpQu6AI6z8=;
        b=cphSuUKiFc2Th3L4iyAGmTLBMxfTFskcCeZUXXcruRcFrs1G25IcZ8AOyClKhgXuMS
         FsDlHBVY65qGvYcH3A9wfW/k5n5FxfpRKWbB1bXyIMCgIbELvMy3W8BByn1BE5wMdqhg
         enNCI3q53VSHey4aXv6pBrKJXwJ7/t10vGu2/1K+k7pUYb9sIgr21bgn5cwlBNeKPTxx
         aJP2FlbAZ//OPQsotWPEpBUw8qg4I20KwTkEpTKF7gckIgkLOgyquwZ32nBXWEo4ro72
         pgHC9LuA7CI+EvGFABXXIM+R8cuHGvY00zdMg3OW3ilLIwwOhAMBl2UNT5sbrk2jOXO9
         8Kig==
X-Gm-Message-State: AFuF++lOBbiel8Fq0DqolsaAI3WljDkiCPVOJebdpx1gK79zcKqvi9h7
	9ZJ2Xy33EKD5agI7Y5DxzW4C/2WPVRZigyKdxTLhvhcIE+H3zJMHwd2dMJmBEZn0BMzXHxZUkwf
	zoGo30zAzYOFUsouv3nA8Znv2pvB1YfP4W4xI0eDm
X-Gm-Gg: AR+sD12sIlbbabgyY7VxkW+fW0DG3s94ZX2YrNEaYSxReGu7IGN28bhN+ZUXkYjTUv2
	akl6XW4BhtB2/17giGnKqmvWY/no70YRYg6J+IXdrqYvjnqauXya9r7s39WKEPksWBgR1BJ0ir+
	tkcBXXCFkpPC2x1gfdsNKQBwotld+0SZCZwsP4k+dL5P4+oME70nXXPHtHdshW5wv6dOAAuzbdv
	rJcpBUuFpmqEn0PrQPuFIMB4w7xwfAnIGllDLYOHd79lUULoYTgwxnmI7tQiIGfYDSyVGMU5CZI
	ECAAK//8+infy0dPAguK9NRgxQLuFbTna3yoHfMcQsqEdb0jO5KOVRrcRfvHsQCm3/1wff1VjMU
	WZ18/VTe7wienElSXi3pRxFLiraBIpMQ=
X-Received: by 2002:a05:6214:3284:b0:8ec:cdb2:5e11 with SMTP id
 6a1803df08f44-90c80944085mr245242406d6.2.1787545673632; Sun, 23 Aug 2026
 21:27:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 23 Aug 2026 21:27:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 23 Aug 2026 21:27:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aohUbUKcvUaoVFEc@google.com>
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
 <20260818-gmem-no-return-page-v2-3-5298f42d49bb@google.com>
 <20260818092717.3F4871F000E9@smtp.kernel.org> <CAEvNRgHEVxO+1Mkoc3-c2+qSrKWnD+BDe04NBvuwGU6BL0amzA@mail.gmail.com>
 <CAEvNRgHX-NebA7z3twusis35E_grJNTrbse7aUZ6+D=qpQn14A@mail.gmail.com> <aohUbUKcvUaoVFEc@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 23 Aug 2026 21:27:52 -0700
X-Gm-Features: AcwNN1WhbH4c-NgfbWkg3bEeOg-8KA8lr3Xwk93Joy7eFGoTTGPATKUswa3gE6A
Message-ID: <CAEvNRgH5ZQPGYzg+YdtEktZ72DgK9PBbzcmC_QFN6M0_6wuo1w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] KVM: SEV: Drop page refcount early in VMSA reload
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, Oliver Upton <oupton@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Aug 21, 2026, Ackerley Tng wrote:
>> Ackerley Tng <ackerleytng@google.com> writes:
>> >> This is a pre-existing issue, but can this allow a malicious guest to
>> >> cause a host kernel panic?
>> >>
>> >> Looking at sev_gmem_make_shared() in arch/x86/kvm/svm/sev.c:
>> >>
>> >> arch/x86/kvm/svm/sev.c:sev_gmem_make_shared() {
>> >>     ...
>> >> 		rc = rmp_make_shared(pfn, use_2m_update ? PG_LEVEL_2M : PG_LEVEL_4K);
>> >> 		if (WARN_ONCE(rc, "SEV: Failed to update RMP entry for PFN 0x%llx error %d\n",
>> >> 			      pfn, rc))
>> >> 			goto next_pfn;
>> >>     ...
>> >> }
>> >>
>> >> If an untrusted SEV-SNP guest modifies a guest_memfd page state to VMSA
>> >> using RMPADJUST, and the page is subsequently freed, rmp_make_shared()
>> >> will architecturally fail on the VMSA page.
>> >
>> > I need some help with this one.
>> >
>> > For the initial VMSA page, IIUC snp_safe_alloc_page() gets a
>> > non-guest_memfd page. This won't ever go through sev_gmem_make_shared(),
>> > so we're good. snp_leak_pages() doesn't actually leak pages, it just
>> > tracks leaked pages, but __free_page() is skipped so the page is really
>> > leaked.
>> >
>> >> Because the error is bypassed without calling snp_leak_pages(), the
>> >> firmware-owned page is returned to the host page allocator.
>> >
>> > For guest-provided VMSA pages, those can be guest_memfd pages. The
>> > refcount taken is the one guest_memfd holds. Without considering
>> > conversions, just considering truncation, sev_gmem_make_shared() is
>> > called from kvm_gmem_free_folio(). Sashiko is saying that
>> > rmp_make_shared() will fail, and the folio is freed.
>> >
>> > Sounds like this would be a problem if the folio is used elsewhere...?
>>
>> I looked closer, "15.36.12 Running SNP-Active Virtual Machines" in APM
>> Vol2 says "After a successful VMRUN, the VMCB page, as well as any AVIC
>> Backing Page and VMSA Page are marked as in-use by hardware, and any
>> attempt to modify the RMP entries for these pages via instructions like
>> RMPUPDATE will result in a FAIL_INUSE response. The in-use marking is
>> automatically cleared by hardware after a #VMEXIT event".
>>
>> So it's not true that rmp_make_shared() will always fail on a VMSA page,
>> it's only true if the guest vCPU is running.
>
> Correct.
>
>> RMPADJUST sets up the VMSA page, and telling the host using
>> SVM_VMGEXIT_AP_CREATE is how the VMSA is set up to be usable. Then, the
>> other vCPU needs to be started and running, and then:
>>
>> If the host truncates the VMSA page or host closes the guest_memfd file
>> containing some other vCPU's VMSA page, sev_gmem_make_shared() on the
>> VMSA page should fail, but the page is released anyway and we have a
>> problem.
>>

74bdfb2f6d18 ("KVM: SEV: Forcefully invalidate SNP VMSA if its backing
gmem page is zapped") fixes this :)

I didn't follow that full discussion and now I get it. Here's an
explanation from another angle:

This VMSA invalidation is interesting in that there isn't really any
communication to SNP, because the host doesn't really have a direct way
undo the RMPADJUST.

What the host can do is to RMPUPDATE the entry to be shared, which is
what truncation already does. The key thing is that the RMPUPDATE has to
be done while the vCPU isn't running.

Other than invalidating whatever kvm is tracking in
svm->sev_es.snp_guest_vmsa_gpa and in svm->vmcb->control.vmsa_pa,
sev_gmem_invalidate_range() has another side effect, which is that if
there is an ongoing invalidation in another CPU, it keeps requesting
KVM_REQ_VMSA_PAGE_RELOAD, which stops the vCPU from entering the
guest. Keeping the vCPU out of the guest is the thing that allows the
RMPUPDATE (rmp_make_shared()) to work.

This loop keeps the vCPU out of the guest. It's kicked off by
kvm_arch_gmem_invalidate_range(), and loops until
kvm_gmem_invalidate_end() is called.

.free_folio, which does the RMPUPDATE, is called synchronously between
kvm_gmem_invalidate_start() and kvm_gmem_invalidate_end(), and so we can
be sure the RMPUPDATE will not happen while the vCPU is running.


A guest-provided VMSA is set up for a given vCPU (identified using
apic_id) at a lower VMPL. I was also wondering: what if a guest just
decides to _not_ report SVM_VMGEXIT_AP_CREATION? Is it possible to just
RMPADJUST and not tell the host, such that sev_gmem_invalidate_range()
doesn't know about the donated VMSA?

From working on the reproducer I don't think this is possible, since
without informing the host, there's no way for the guest to use the vCPU
with the RMPADJUST-ed VMSA. If there's no way to run that vCPU, then
guest_memfd is always free to RMPUPDATE to make that page shared. The
host can always RMPUPDATE a VMSA page as long as the VMSA page is not in
use.

>> An unsolicited shared->private conversion is fine since the VMSA page is
>> already private.
>>

I need to look at conversions again to take this into account, will
explain more over on that series.

Meanwhile, there's no issue here because rmp_make_shared() will succeed,
so the leak won't happen.

>> sev_gmem_make_shared() would fail on an unsolicited private->shared
>> conversion. The RMP entry would still indicate private, and guest_memfd
>> would track it as shared...? Bad.
>>
>> I've been trying to write a mini reproducer like a selftest but I've
>> still not gotten it to work yet. If someone knows there's no issue here
>> please let me know!
>
> I have a reproducer I created to prove and validate 74bdfb2f6d18 ("KVM: SEV:
> Forcefully invalidate SNP VMSA if its backing gmem page is zapped"), I'll make
> sure to run it when applying (the final version of) this series.

I got the reproducer working :). I'm guessing sharing the reproducer
publicly isn't allowed so I won't.
