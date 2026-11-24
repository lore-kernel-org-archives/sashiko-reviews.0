Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795563023;
	b=WMFOWtvkybD9+abDbqp8jSNHlzJwVZBWAXn4fgsa7jXfYKajKGFLCOYhrK53uMDgzmc+
	 wPfb/Zp6bljJGQTgNEVoYSqyT91Y8bpmO3w+MqwwueLQ/5/mpPz4dUHipkyltqjMx6+i/
	 GrlEO9iehG+R3qLgerJzbYwLcau3aoDfzPk91EkCwl6O6hh6TAGP8bhyrPD4d9goPAmgp
	 Hii+FM4yMb30nejwfeWgPS/IJRz4sqAeUg4firADp0EizM5BBp657IaHZ0HbOraZRFMfX
	 Ogsfn/0PW2qMkeZ7Sgtj8ONcp93SvkB30FDep9Pfmlq4JB9THonih9Nwknx2qV9Jtug==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:In-Reply-To:
	 References:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tmoluJRxJ9HN+1c8Y5zGpOvMcLNPpYDSuvXeIRfQoGU=;
	b=T46d6kZ8Y0gAwwINZfRhNofk4vTgGnXjfWJX/4FgER5qpHhq0dezCeTD/5dMPwxp8Iav
	 +6JnkgY9LemQqoCQ1vfbY/m1GAeGpbflvBPwrCHMbhxAV4C5OD6UNyiDoKUVEZVUc2ZyA
	 snK20qM/bkMF9A5rUyYtKCyahzFXNxQx86vCNztBKo0Q96YUddegom0T+H6J5z+G8mOgO
	 mMVJsRuR9M06zgqN2q5AjDYlIEMO4QeNEga5gE9O2g6RutoJ3kbnUcZSbxzRAASynUMX2
	 CexgYCd3wHU3u/IbWZIkSK/UcmsAv/e87Rh5gBC/Zk7Gypmgjei3KbzS0LtyRlSLDZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z+N1+2Ix;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3504606A327
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 23:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3504606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z+N1+2Ix
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9213f004a14so62208956d6.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 15:30:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795563022; cv=none;
        d=google.com; s=arc-20260327;
        b=J5F6N4KNepXNPp34K3SMgLgIZPTRyI3rIsZeLpUiihc/zrWd9KBsnRWLOrSHTjRuZu
         5Xc7abWutlw3wqZ4CRxA/ZJ2WvpZZF/8KEpp6GziDfZnDyrV38e1ZsysOxExj40eTkxc
         KQKiztk8tW6Ks4JRawS2MWF3/FJEdXrn6pt0PdhxnfVc7WWil6nfzIqKdzKGsaPRHkaW
         LKkljrlwJe0Re+d69Iu486+qAlr9TojMGQR8ajaW5/Jtx4osl1FN17roW5ERxAyfgr/B
         RCHFwt5Jjvmt06tNs1Mh5xFa0Jo9HyOimbWjJJjncLRjbLC/aEkzSmFd7omHRwsBEVYM
         kXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=tmoluJRxJ9HN+1c8Y5zGpOvMcLNPpYDSuvXeIRfQoGU=;
        fh=eCNUqcJ7J6LewMqNI6tVT0HYRya4rJMTDgRKShVFyDs=;
        b=qeVSHOhrgwehF62w3BZy7ErxxCBPbIblpLc+atXGds4NCHNVOQBnbhrG/u2vgXS2iV
         cgRICDUUw9Li+eupvFWSHYqAjHhev+pt1RMP7xnKUpmQUv6qi+d4uHtiRoH99BbBv6mX
         ZLRSjd8c35BED6rLBCR/etCJeXXTtANIhm6Og4fXEW27uSboBFN4TDVmpVXOv+GBzAP2
         bWrLkoZzeYZkQyQ6BKww466Qigheaq6cXlzy1dyUR7Xn/jcK/I50I7gLPaFRoWwOw5d3
         BmrmW/lOMXBkwd3jt9CET9w/iRlQlNknujsZI0eXX7D/JLX5TZmQuTOWLjchbE9uQxp3
         Z8yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795563022; x=1796167822; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tmoluJRxJ9HN+1c8Y5zGpOvMcLNPpYDSuvXeIRfQoGU=;
        b=Z+N1+2IxlpJXz2J1mGbaZGsdgtxwXU/K35KSNyDZ3Jn9qbx8M04ueEqItZrKnoZGyv
         kgClWU/r3hy3/hBVVy0fuTVr2jgwRN7t9b6aBXSH0vHBQT5O1sxu5F4LVNjQgNL2Drm+
         NbC7GK82F7bJFQ37RN0/iYmJQREJBzekDmukv6ucPqVmnsvrjmWEudZUveLPfiGEfVRy
         nu0riMj9RpWLKsBCtxXiyPxdEFFUy+z5D23CNNEMXo/iBhh5ckpDz9Tv6HgstQ16j8H1
         k635v8XfltMnnEShQb1P/OoSH5dwV7SJrM4xL0jeMGmRc5qA+yyZXIOGyHTCuroyTn5Z
         SKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563022; x=1796167822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmoluJRxJ9HN+1c8Y5zGpOvMcLNPpYDSuvXeIRfQoGU=;
        b=SJnsLqBeTrexWR0V3P9hy4sLgBbVNusSF4r0KHjK3WdVmuWTl+KqFkdxXRpMt3kks8
         s7bSVkNvPCDD9vTbw3Sjq62lIgcyLVsa8M/eBrLX7z4eMQtxeBsz/Rk498f0SwR7hBI/
         zFDuaz/6DA/XdBBZsXFMmZO5Fn5m+3bxw2cwtsvw0Qy3dYKOA2xR2hBJhVmRiqhBqKSQ
         bYn+OkfdJT/jSq/wq/oRhmYEeIw2LMEcjVLRogxUNbzR8iD13yLoMYsBLmgosDqhwCga
         b0vD4Ob/71Llc9icY2DsoKbOik0HWWSjHvhOs6UVcTnhGTupDy/Cpbl4M82Dy4p8DDz5
         ZmvA==
X-Gm-Message-State: APuU4Z/rzOjeCqnQItNJMuSayyMDFufBzjIkK1uTSACsvnwfbLb6AKeU
	1T/ZiCVr92TzdKJjd39b+Lbqcd5U6Rh0s/t1pKN45xLnkq1K5Jun2tjqajh0VsAMpQHONXryDtc
	gU6ypL2zh3Jny8YM359MdXujA/gw+PjtGmn+GaYIV25NddgEFIlfIz/iu
X-Gm-Gg: AZFdTZeXO2+aXIXAoqo/OEVcQo0DyFy0HwhjAZTfYxh9yrMfXUTt1yt1SPvYRIHdP9N
	Sn/W7X3bssdsj1T75Oe9H9gsazw8MUM8fvNTvBsjSf0ux7zxyfrf3qcVmqJoNVAldXqmUv5TKX7
	QONMIA0VWAms4hAw9nEh3DBY9Ocl+i2X8PoyPgAxG3ItbvcQuPOU4jE6OnE7l2gY4icSZkVXE19
	ggI30wc6fRrLTnwOmwz1D2tOJNCdczNkGX/3I5iiipbJnmtzD9NZULHYraur+qmiBhuzjkw39HD
	bjAx1X641Oc+C/hBi0zhnmnoCDVCFge6bWJAKMNdaOLeLY5dXN4AMaYz2ooVJCAzPSMPxQfV1/9
	7kiCxOr20IkaSQr3uq4xBKAg9DowLQaDh5TEm7QwEhdaL9Q3GQsD1ReuGtyK7gPArft7+/fHpJ7
	l0PwHJKkDW6c1VArRd8hzpQbQ=
X-Received: by 2002:a0c:f412:0:b0:921:541:246b with SMTP id
 6a1803df08f44-92134a9123cmr301795036d6.38.1795563020302; Tue, 24 Nov 2026
 15:30:20 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Nov 2026 15:30:19 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <sashiko-outbox-229096@kernel.org>
References: <20261123104233.95710-1-steven.price@arm.com> <20261123104233.95710-2-steven.price@arm.com>
 <sashiko-outbox-229096@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 15:30:19 -0800
X-Gm-Features: Aa3M54o433xbzGFqcKUYR3R8okBny6foO_6QsBRN_-OVy4JGrTMEGT43jesbap4
Message-ID: <CAEvNRgGU+z609edF+Mw8xQ0NDUDKn9jjxJjJWTyUqJ0N2BGEHQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
To: sashiko-reviews@lists.linux.dev, Steven Price <steven.price@arm.com>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] KVM: arm64: kvm_arch_prepare_memory_region() rejects non-mmap
>   guest_memfd
> --
>
> commit a0665f8dc612d05686ef019cc8462841573fe88c
> Author: Steven Price <steven.price@arm.com>
>
> KVM: arm64: guest_memfd: Check mmap support when preparing memslot
>
> This commit introduces kvm_gmem_slot_supports_mmap() and uses it in
> kvm_arch_prepare_memory_region() to require that all guest_memfd-backed
> memslots on arm64 come from files created with GUEST_MEMFD_FLAG_MMAP.
>
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 1db10d8d6db73..2825fccd2a197 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -2839,10 +2839,10 @@ int kvm_arch_prepare_memory_region(struct kvm *k=
vm,
>>  		return -EFAULT;
>>
>>  	/*
>> -	 * Only support guest_memfd backed memslots with mappable memory, sinc=
e
>> -	 * there aren't any CoCo VMs that support only private memory on arm64=
.
>> +	 * All VMs need mappable guest_memfd memory, as the memslot's HVA may =
be
>> +	 * used to access shared memory even if guest faults use guest_memfd.
>>  	 */
>> -	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
>> +	if (kvm_slot_has_gmem(new) && !kvm_gmem_slot_supports_mmap(new))
>>  		return -EINVAL;
>>
>>  	/* guest_memfd is incompatible with MTE. */
>
> [Severity: Medium]
> As reported by Suzuki K Poulose on v2 [1], should
> kvm_arch_prepare_memory_region() drop this guest_memfd check altogether
> rather than rejecting memslots backed by a guest_memfd created without
> GUEST_MEMFD_FLAG_MMAP?
>
> Both gmem_abort() and realm_gmem_abort() fault in guest_memfd pages via
> kvm_gmem_get_pfn() without using new->userspace_addr, and
> kvm_arch_prepare_memory_region() does not verify that new->userspace_addr
> maps the guest_memfd or any valid VMA.  Requiring GUEST_MEMFD_FLAG_MMAP
> here fails KVM_SET_USER_MEMORY_REGION2 with -EINVAL for VMs (such as
> Realms) that bind private-only guest_memfd instances without allowing hos=
t
> userspace mmap, and on v3 the guest_memfd maintainer noted that this chec=
k
> is unnecessary and should be removed rather than exposing
> kvm_gmem_slot_supports_mmap().
>

I agree with Sashiko here. I traced the history of this check:

    if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
        return -EINVAL;

In [1], Arm64 guest_memfd enablement, !kvm_memslot_is_gmem_only(new)
meant "this guest_memfd does not support mmap()". Arm64 had no CoCo
private-memory VMs yet, so guest_memfd was only usable for shared memory
where the host VMM needed mmap() to access guest RAM. Rejecting
non-mappable guest_memfd slots prevented unusable private-only memslots.

In [2], pKVM support was added. The v1 of [2], [3], says pKVM uses
anonymous memory. pKVM doesn't really specifically use gmem, so there's
actually no change, this check doesn't really affect pKVM.

Conversions [4] made stage 2 faults (mostly on x86), always get memory
from gmem. On arm, as long as it is a gmem memslot, it already always
got memory from gmem.

Now that ARM CCA supports private memory, we should drop this check
completely, I think David noted that right when it was added [5], and
that's what Sean means too [6].

If userspace sets up gmem with a memslot and doesn't set up mmap,
userspace probably won't be able to set up a running ARM CCA VM, but
that's userspace's bug imo.

Imo even back in [1] perhaps the check didn't need to be added, it's
just a userspace bug to try and set up a memslot with gmem that can't
really be used.

[1] https://lore.kernel.org/all/20250729225455.670324-21-seanjc@google.com/
[2] https://lore.kernel.org/all/20260330144841.26181-1-will@kernel.org/
[3] https://lore.kernel.org/all/20260105154939.11041-1-will@kernel.org/
[4] https://lore.kernel.org/all/20260910-gmem-inplace-conversion-v13-12-dd6=
fbf94f4e1@google.com/
[5] https://lore.kernel.org/all/2195c01b-3a17-46c5-a013-66922e8509bd@redhat=
.com/
[6] https://lore.kernel.org/all/av8No1rvJLXwciId@seanjc-mac.roam.internal/

> [1] https://lore.kernel.org/r/26a29420-8d27-4069-bbd5-28692c9e8542@arm.co=
m
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123104233.95=
710-1-steven.price@arm.com?part=3D1
