Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F07431E72
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782936790; cv=pass; b=XWQL/Hr0OJyOb0TcJ2aPRgnaGAiOkk3IZ4G7EgPZvZPmRyV75xkleEb98f82lmHm4GkvbFrQhtircfsW5UQ7gUdEvHg6pCk8TnOkukgwdIgpx2e8MT/3X7qvis1AkDH9lN7A6wYSC057zWNbwr9jKXHROCW43k5g0CannINPHOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782936790; c=relaxed/simple;
	bh=QYLv0iYYfI+40T1vZSVNdGPEoBHxmTYvYlLcxP2K7oY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kz6Waaz8vid7ZrGseJvq0aPP0yWFXWURM6pmYWy0TegcLHV9QIfxH29lrcAGUz4Q+FZ6tUTZqVZYlV9YgGD2CFOM8pnLJjEnuxm10VG2zTV3YqpORh81Fi3dgYr2kiF/MB8RrTeBan9ocWR2mp9sNGD+OB2YtnemRcS6Y2+n240=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9ZihYrH; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9ZihYrH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so9188635ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 13:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782936788; cv=none;
        d=google.com; s=arc-20260327;
        b=frtZE/sw2lk+ci8sMvNFAOJcsZyKMSP1BDg9Wsaqt7a09xoqgk+yqhjR8qS4i4ePYt
         EPL1WVD3yxYqYgqitU9fKpwymi4UG5MGRApdDolDfrXxlt8tmy9Nyf1MZg3Xaj+jozpi
         sFqeF11le1V6G480hEE8/ytIMIz4zpr6L4fPhDhgZo66ZSgAmV+eNF76Mq4S4fzTrP2b
         YvKDw8zn//qrWwZ2RKW8U/+sZMh6mkMbKgqOsmBPv7CkOiu9E8fKwrXIdsYapB0N4Ufo
         cFjCZh6Faco3lHdFYuYVBJiusAqsBIZylWURaxiM3CPJTiQDkiG1ZhqBka1xKMV9SnVM
         EHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=3AXD0+6ClJl4llB0fCYUWomrqQGyd9hq9aZAvk5puJQ=;
        fh=n/xVjRsPLSx48DK0mlLV8S98n4Bay9rv1xBpMnS6M6Y=;
        b=BdESokEaba9w5seBvQohVfsJvpK8iumgl/LsA2iQIfL05lhPrxCwPHrPcT9wdX/trx
         ahYeutqDwS41lFFhWON9ePXvIm5NqjPrvBQsFSD+sBj5tFSWrKO8ZfnsY/u2FMl5ElZ3
         G0c9hpG07Ie8xyI2Ipeb+Pr+xle9y0IWXU4TArn9yfZr/VDmTcP0KU9ax1Nx+nD43/5n
         pWjgtG0CHEELcR6qxnQGsdZX1EVoHTq5Ir2CX9K5Yq1q5u1Ml4eIXD9kU4XxgrdnWudC
         Tb6oY6wKCswR9Vi36pEoa9UFq4S6GKwu/M4PzDOlNQVjKl6N16KcKAlhX5wnc17jYslf
         /1AA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782936788; x=1783541588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AXD0+6ClJl4llB0fCYUWomrqQGyd9hq9aZAvk5puJQ=;
        b=D9ZihYrHgAGMOtz3dX7ezuzSemVrHfFhdCBlq5FHp233504wZHBvWhhZsvVNaJzWgW
         eHT5C+k6Ob49kMkun0EY8YebnxtVkxnm7iG61ID2ZBaPplRd0QBAq+zKI4SUkV2y1JoO
         Uyb6AeBKzryekOjs/Vk+WzrrI7G9nNW/IyeaUeQVsh67PdbTgJGzDp3doWaBMkPsQDia
         WGzfetJPF6P9x+k71mRC0UB5s8E6v+vTjYgiUVy0xBLuhcAX4LJihWNpM2u6HVYqD0k9
         mVXXiSlBTN2QVj6M9JLLONSQDqbRA2v3TAsll5AHiW79Qz44fkGq8AgSF9Mj7ISTuAvr
         R90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782936788; x=1783541588;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3AXD0+6ClJl4llB0fCYUWomrqQGyd9hq9aZAvk5puJQ=;
        b=MwXmrlVoSJJnYarGSdE+mq/bXVvck/d2plsxHviEWQvjmCgVg8THnI5noaFYPTzmAY
         IWZdkm3/Qx/PofkvS+SPTrINvPlIWmZPpu7c/0A74op1/g4SH4uX2T+8t4ZxEalsgVQ4
         mCSEcSe7VmcTdIw3QOxni4lIoep51knmQX2Fo/KAgfoZqJHc7FbNV3dYBU6FC1Kzqksj
         Zdn5jMZ3e1+RiLQug4v0Wi2ZU4dwueOWOAIq2hdjtRoalxcoBLdYdAEJDNqZSkhWvAYo
         lWa6MdCVFTMlBQH5YzTnKQWW0Ar+hTP8n0QVixk4/XibBQnZHgFIK/9iir03aRvxaXuH
         H1Iw==
X-Gm-Message-State: AOJu0Ywgv0hcwdUsmUhPMdWVcm3B2vj62CB2KFcHW1LSt2P2niAS4M23
	Zvqlf2Rrx0mEgpFVQaMsvrLhySrHkdr7XJxMQGDPC/g75V4ZMy32Tj68PzCNbX4CtkiGdzB3pMm
	tGuE7YcV9Xh3wBeLvB8GOVWEuKrDO95IPLucyGQzBnyYRImlhsJDccIzj
X-Gm-Gg: AfdE7clDXDmzL7MBxCaqnonD1bdXKOt2sDiN6BP7bmU7is3yPjboqHhblrDGjQzAd1t
	zT1VaLAK05NeqSLB8EeOQVXjoweG7fC/hwAnRrAiB4HPdLDW23BcP74737qWrsk7ym3oKD+j2am
	WjaUjNhqD89oItB2pv3zhhP+IvlGtX2TMBoS++pavOYuyz6rB0V1e+skh7AYjkW3iqFeTb8qGWi
	84XcNEQDA08W/8rxmJ1FBTHDLZw7svleIKPDvXVEKTO2AXNfnlMqgl8Yqj6ySVqVmDrYY+5b3wv
	N6P8tN6dIrr4hTw24Ly6kWUz1BcpquN/qQDUbFWmoyohA9ICsdFf5L7uLs8YYEm+/bBegA==
X-Received: by 2002:a17:903:4587:b0:2c9:cb6f:9015 with SMTP id
 d9443c01a7336-2ca7e8dc783mr36005365ad.23.1782936787655; Wed, 01 Jul 2026
 13:13:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 13:13:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 13:13:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260630214952.98C851F000E9@smtp.kernel.org>
References: <20260630213711.479692-1-seanjc@google.com> <20260630213711.479692-3-seanjc@google.com>
 <20260630214952.98C851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 1 Jul 2026 13:13:06 -0700
X-Gm-Features: AVVi8CfKCFCsyWj4WpGKcapP9PT26PoMuulY8DcRLm30JnBcfaWZumZ43V66etU
Message-ID: <CAEvNRgHt1F28iDegRxtYDfy95iQysLkFW=7YPruwky_stf5TLA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: TDX: Return EINVAL, not EOPNOTSUPP, for NULL
 INIT_MEM_REGION source
To: sashiko-reviews@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The `region.nr_pages << PAGE_SHIFT` calculation can overflow a 6=
4-bit integer, bypassing GPA boundary validation and leading to a host deni=
al of service.
> --
>
> commit a54da29c3e4be3226e4ebf9df2f4182c350df998
> Author: Sean Christopherson <seanjc@google.com>
>
> KVM: TDX: Return EINVAL, not EOPNOTSUPP, for NULL INIT_MEM_REGION source
>
> Return EINVAL instead of EOPNOTSUPP if userspace attempts to pass a NULL
> pointer for the source page of INIT_MEM_REGION, so that KVM's ABI is
> consistent between TDX and SNP.
>
>> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
>> index ffe9d0db58c59..b0ec054732b90 100644
>> --- a/arch/x86/kvm/vmx/tdx.c
>> +++ b/arch/x86/kvm/vmx/tdx.c
>
> [ ... ]
>
>> @@ -3247,8 +3244,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcp=
u *vcpu, struct kvm_tdx_cmd *c
>>  	if (copy_from_user(&region, u64_to_user_ptr(cmd->data), sizeof(region)=
))
>>  		return -EFAULT;
>>
>> -	if (!PAGE_ALIGNED(region.source_addr) || !PAGE_ALIGNED(region.gpa) ||
>> -	    !region.nr_pages ||
>> +	if (!PAGE_ALIGNED(region.source_addr) || !region.source_addr ||

Since we're changing this, how about separating/grouping conditions so
that adding validation is clearly different from alignment changes?
Perhaps like

    if (!region.source_addr)
	return -EINVAL;

    if (!PAGE_ALIGNED(region.source_addr) || !PAGE_ALIGNED(region.gpa))
	return -EINVAL;

And this one might need more code if we're fixing the issue Sashiko
pointed out.

    if (overflow)
	return -EINVAL;

>> +	    !PAGE_ALIGNED(region.gpa) || !region.nr_pages ||

Looking at this again, why should region.nr_pages =3D=3D 0 be -EINVAL? Why
not do an early exit and return 0?

>>  	    region.gpa + (region.nr_pages << PAGE_SHIFT) <=3D region.gpa ||
>>  	    !vt_is_tdx_private_gpa(kvm, region.gpa) ||
>>  	    !vt_is_tdx_private_gpa(kvm, region.gpa + (region.nr_pages << PAGE_=
SHIFT) - 1))
>
> [Severity: High]
> This is a pre-existing issue, but in tdx_vcpu_init_mem_region(), does the
> calculation region.nr_pages << PAGE_SHIFT overflow a 64-bit integer?
>

From what I can tell I think this won't cause much damage outside of
this guest, and since INIT_MEM_REGION is called at the start, this
overflow is probably just busywork by the potential attacker, but I
think it's still worth adding an overflow check in case more code gets
added that could actually cause issues in future.

> If userspace calls KVM_TDX_INIT_MEM_REGION with region.nr_pages set to a
> value where the top 12 bits are non-zero (e.g., (1ULL << 52) + 1), the le=
ft
> shift by PAGE_SHIFT discards the top 12 bits, evaluating to a small value=
.
>
> Does this allow a malicious host userspace to bypass the overflow check
> region.gpa + (region.nr_pages << PAGE_SHIFT) <=3D region.gpa and the
> vt_is_tdx_private_gpa bounds check?
>
> If bypassed, the while loop would then iterate based on the large un-shif=
ted
> region.nr_pages value. If a guest_memfd is mapped at a shared GPA and
> initialization is started just before it, the loop could incrementally wa=
lk
> into the shared GPA space.
>
> Since KVM invokes tdh_mr_extend on that shared GPA, which the TDX module
> rejects, could this trigger KVM's TDX_BUG_ON_2 and cause a host denial of
> service?

TDX_BUG_ON_2 is not a BUG_ON and won't take down the host.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630213711.47=
9692-1-seanjc@google.com?part=3D2

Not a huge deal if we just go ahead with this change, thanks for moving
this check up front ahead of calling kvm_gmem_populate()!

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
