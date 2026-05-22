Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC1B1F7916
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779476651; cv=pass; b=omI6NJadvhaZ/VRryJOBhBew/nem53lVQhPruRs1G24tRNbnD5G6eNmZOxC7yAd5KJSSnXLwfnDqZPg2josLeRomnQ2WQczezk3W5zlD/mekIsX1iNjUrIKVe82Nh10OInRCVWVwwzZH9j6v/b93i4MSBpG8O/S1uOlOhx20iIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779476651; c=relaxed/simple;
	bh=8girElLKDDbdH3u3t1ra9Bb+bSVC/vxxK1ijFpwESFU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYQtp0GpVVhcO9YdZ0SW3jeh48n9490UN/yohok6Obs+qpxaiy1vAxMkEkMtO5ZAWWARTszG0wKsCvYFt+z3RLSampN+Jcebr7qZVDF4fo/XhBBSaw++FtUhKsSY5grctQgEN+ETuE03P+o9/rH56KfnQe9N9VkYsn9fKvE36HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g9hNM6e2; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g9hNM6e2"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6314a0eefb1so2431998137.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 12:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779476649; cv=none;
        d=google.com; s=arc-20240605;
        b=MRWEmd6a+BKeTq9D+pO+PEJCYoHNUYkmeJyl9cqGDffBYvP/qvkgbniRBaDtIPH2Lr
         M0YQTareJGRfgSzzkWhoPRrILObyYQEmp9CTfIQPst3A04LfqIOSGPsuPaEMBnwLQugP
         zDn8ezcF8LA406ztr5VTMR3C6bJfpbWYdlbYU8pqR3HvW7dJTVNzQ3qaofvG0Zrg+K/6
         gN0lcJpONzdIRGrWvydRReqodDDNljV9bmJLVSGwEpKPtGag8v3kDTgTzR8QdDO8gSDO
         hyrPY9jud8ARvp7Qeux14PNdCW4gT2qjTPRGD/VKfcsCl4oyudIAxBTYf67PRHD34Cvv
         paAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=brW7UeKFZ/7/NrcHA0OD14WL8ph3oRlKy3KH21ODKrQ=;
        fh=n/xVjRsPLSx48DK0mlLV8S98n4Bay9rv1xBpMnS6M6Y=;
        b=FT8wJ4uH/hTVxBZf+a26cBiqd1lqJdkpQNPmuihh7+IChmoLfk/K25nGD1sH/TbTKv
         I8yVO08CKj9QPcfFVH6gOBD7f57bQhXDeQL716an25pHKBBqNhZeyypGsR+4FU6NoMku
         ktS13sjr088hcbo9Gw+fJtadOcsUVJa/2WX+1rHIwGKxRttTnIhuR5j5i4RyHyfR8qI5
         tXY0/9ocVvpPn7PP5cVmICuKGhkW63jlF2FEiYjGEx/xYU/8ARNq+AWDvzpmfUClIZiu
         tZNnn57QKxyEiLHxiuC0HNI2sYsDJCitOywTDzzNkPj6K5cdnGyLyMCoTpJikpzNGBAO
         YeaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779476649; x=1780081449; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brW7UeKFZ/7/NrcHA0OD14WL8ph3oRlKy3KH21ODKrQ=;
        b=g9hNM6e246cdMQGMCTgw7Rharx2NaHdZ0e9wmLSSwDwF4j9IQKBQYOioUQ599JSezZ
         X08sK1V//ZKC8xDcKush4jY3ONVLbNykfYxtAQOQmeCbypOjKBL+UyCFG5ZTJvhS6P0r
         p3BKqxUsQqlaZUrqiGKH9gWXjSTSjQ2y11h/6yC2Jbcyxl5lSQ9bNBU+yruDVLyeUfpB
         rSxuhBCy8hMJgfmRr3eM2yD4DQ6cpfuOLIa5xL/lYF5B/GaUf7i31pvSic8bYjJryQOj
         N9Z0S4pfsecS5ceIUntWDB2XvN4gnCrNH32k+OQGBSOGdhS3dr0PcOdq7d5+2q4p/rwZ
         wpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779476649; x=1780081449;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=brW7UeKFZ/7/NrcHA0OD14WL8ph3oRlKy3KH21ODKrQ=;
        b=CouYSCnN2nSIL39tgOiOZYwLiZGOcuteshY7NZ282AMtm1n/rrZ3jjhSaOvJAAe9pm
         zYtuiPry7xNH4Mw6eXmJFqZX/P89JxsmeDfbL+qVxI4B+A5kQni+sszGODkWYJKHs1yQ
         gBRvOjT91RGtdeES2Y14QXeCEGZ7QQnWDwecbSp5DPeW7D5CfBcd0LMTuul0dxvpmyua
         piNqvEbc2mfiuFi0A+wgTF1RhK4HuweGPiOJ+o3ISgJGjro+pEvj/w0ekunSkBQh13ZE
         8Lieoo6/CEm76ZP5AbeKEAofWVenPoqubjosg/+zQEZTQKAlAN7/KA+zI/AviY/R2s+J
         j8Zw==
X-Gm-Message-State: AOJu0YxztKMTizOmnNWckiT/sTi9huqCJB4Dh7y4rVAsTOHMyeMP/eLJ
	rfz4LY1NNa/91ORf/XU2ErnIxBHIRImBt5grnrb2pN0jihI8rs9IJKyxkUHr/UEoCq1eY633xcy
	JayqRZuR5BkiP6T/D8nk6DcgJeX6o06R3PSbzDc1XV/KYrafLY9ORCb0gjJw=
X-Gm-Gg: Acq92OHmf5VYOdqe3AIq4lsjz//2o5CVb+Bee89gQ0WLrkTkBXb2c7Q3gP10gfzdyh5
	fFjDx1WtUj/DcRW12W2x06Qbr4UMMDMbStiLrwxQRykfdBJjFAJM6W/SDggf3QVeiqUdE/J4Tjk
	Q41ge1bxa5AnArX6U1rSdqDPVynkYFr2vYqvooVq2gkRJ8Ln1jQKiba08kS2CaNQgE8ngZM6lxK
	NQJ3cJ0vNGMCxUqXANDY3XjfjGbNaWZoskvefBcMyhJTTs6CZ6Pw65CsK8Wo6yKYf0b/y0+6Jo1
	AkGYDWLb+8St5n/me1MJHMGezScGiFJSV2qYmfT72vrXBbLWFfORTmE8gbcmuhDzioXUQpzve/x
	TMSyt
X-Received: by 2002:a05:6102:3f08:b0:631:4d87:ba5f with SMTP id
 ada2fe7eead31-67c7490af39mr2616867137.3.1779476648412; Fri, 22 May 2026
 12:04:08 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 12:04:07 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 12:04:07 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260522180530.EE9101F00A3E@smtp.kernel.org>
References: <20260522172151.3530267-2-seanjc@google.com> <20260522180530.EE9101F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 22 May 2026 12:04:07 -0700
X-Gm-Features: AVHnY4Lmf_9WM9qkGgAhMkcUeOb04XWn-O2dClUcD1FrCa5bUWoqHcEIUbU0eT0
Message-ID: <CAEvNRgGZBrTjgVg1Xk-5mhxMnUWbS79FjdGc+O6NTQyJeEVtyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: guest_memfd: Return -EEXIST for overlapping bindings
To: sashiko-reviews@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The return value of xa_store_range() is ignored in kvm_gmem_bind=
(), masking memory allocation failures and leading to a Use-After-Free vuln=
erability.
> - [High] A signed integer overflow in the file size bounds check inside k=
vm_gmem_bind() allows userspace to map memslots beyond the allocated size o=
f the guest_memfd.
> --
>
> commit 7edaac3f2255cc17c741557ce1e44f51d4cece29
> Author: Zongyao Chen <ZongYao.Chen@linux.alibaba.com>
>
> KVM: guest_memfd: Return -EEXIST for overlapping bindings
>
> This patch updates the KVM_SET_USER_MEMORY_REGION2 ioctl to return -EEXIS=
T
> instead of -EINVAL when a guest_memfd range overlaps an existing binding.
> This aligns the error reporting with overlapping GPA memslots.
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 69c9d6d546b28..46727539d08ac 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -675,6 +675,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory=
_slot *slot,
>>
>>  	if (!xa_empty(&f->bindings) &&
>>  	    xa_find(&f->bindings, &start, end - 1, XA_PRESENT)) {
>> +		r =3D -EEXIST;
>
> [Severity: High]
> This isn't a bug introduced by this patch, but looking at the bounds chec=
k
> earlier in kvm_gmem_bind():
>
>     if (offset < 0 || !PAGE_ALIGNED(offset) ||
>         offset + size > i_size_read(inode))
>         goto err;
>
> Are these variables susceptible to a signed integer overflow?
>
> Both offset and size are evaluated as loff_t values. If userspace provide=
s an
> offset close to the signed 64-bit maximum, adding size could wrap around =
to a
> negative value.
>
> Would this cause the offset + size > i_size_read(inode) condition to bypa=
ss
> the file size limits and allow the guest to map memslots beyond the alloc=
ated
> size?
>

This was also discussed in [1]. I'll send Sean's suggested fix for this.

[1] https://lore.kernel.org/all/ag8BmtzxTlcuA_zy@google.com/

>
> [Severity: High]
> This is also a pre-existing issue, but I noticed the return value of
> xa_store_range() isn't checked later in kvm_gmem_bind():
>
>     xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
>     filemap_invalidate_unlock(inode->i_mapping);
>
> If memory allocation fails and xa_store_range() returns an error pointer,
> does the memslot get omitted from f->bindings while kvm_gmem_bind() still
> proceeds as if it was successful?
>

Will send a fix for this too.

> When the guest_memfd is closed, kvm_gmem_release() nullifies active bindi=
ngs
> but would miss this omitted slot, leaving slot->gmem.file set while the V=
FS
> frees the underlying file.
>
> Later, when the VM is destroyed, could kvm_gmem_unbind() attempting to
> access the memslot's file via get_file_active() trigger a use-after-free?
>
>>  		filemap_invalidate_unlock(inode->i_mapping);
>>  		goto err;
>>  	}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522172151.35=
30267-1-seanjc@google.com?part=3D1
