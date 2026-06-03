Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D373D6CA9
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 16:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504389; cv=pass; b=TC7fOqMISvcpLDm9PwJBrMlnMXIEDx+Qt9Gt5qX2MeT5lhWLzXDTtPcnh/JJ8YgvpLcLwxYnfTuLyCUjMTKW44Vdj7v+RQBRHyOQ+8I/Ys+UvVrRu9JGQoVhcea32Gq8UyYVRIP7ejdVfZs6ZEnsCIHhTSc7+Tu6jr36k88hZLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504389; c=relaxed/simple;
	bh=ZxPkRCLPdwYvE5wVv13N/w4GFCh3fcUHpcgVy3lddVA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dm+ARqSjoNBMoovFUfGVvO43opI7UVEjMpog7sZUCRusCtz1oe/ctno21EDsCK9iWoARQNI7wDxKhS0Vi69hP1dUCb5q9tNDGGE+MnOa6HYf+q3uldvs8cYwT2Ihrd0asJL3IkPPRRyI6yckUz59yyIx14Ua0rk2BRIdaHUhqG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=roJFyWDD; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="roJFyWDD"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304e83724bfso7788924eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 09:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780504387; cv=none;
        d=google.com; s=arc-20240605;
        b=GZSY1VDZagOGtvh6WNfmMiBnDvhOoTlWkxVglvsrCZg2EeDGwGHsoxMhhoD+n8l7no
         XQqNwf+ti3Vu+CvhTfQEScueFxczoEbGsHnNqqvb3b3f9KBEYXvXFQdsKSoMj+AwVEfK
         iHT5GiH+NOgZhHDQOoHcixFOKWHDouC7vJyVvAwyM15broTtgytCuQZA7aSf8ss04XK7
         ZfsDaA1HevtlQ95tjMjF/9OM5mG9Jg33QnCOPhvDOpBVsBHr4lt1veNjI5sdAVtc6SpP
         j1j+EwudnO3K8JS/WmxjhlLkq1g++HSqoWGLrImoluAvy53SBNTiJ/L6HYv2qkVIX4dw
         LrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=Ac75VsX3g/JvZKVcVDB50QISY1fBI93TsemytCxfqQg=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=avs8FvVQ++ZiYSEB+JosyOCtFIMu384chKWUQ9lxlq6s/5zEQHQo5mFch+P5yH9WL1
         cxBiSoC20A6nbyN+NYHWVJdPaBOHk37m0GeD0Y7ch/nC9Mb92tWqpt4/wUKjrRkiHcqa
         edKRFBxB0hqbPSNKAFH6Wo/7xfxg7UnIB24cLNUtbxjSucSrt4q409j3vbssBpZV1BDW
         0HmO1R2TYdtSOZSzFwF3eFY35+Xi3Sc7WthYMu/mOIlzRdSOj0DIRaoeHmVF1GiB+gvB
         qPUGPmxKWJ/n9azXqq+QO3Qk7Yw/urzOWGCAdSurCmzvMSDBTSID4vqFVh27srt4Jkt6
         f7gA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780504387; x=1781109187; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ac75VsX3g/JvZKVcVDB50QISY1fBI93TsemytCxfqQg=;
        b=roJFyWDD7pLBjNirA3HLcH4i47Tk/48T2zXWdvPSlYp07WcceCJwbOgSUBAcbN8e+i
         E8hH8GgoSc1CEUUqX9gTSNNmyKs4HohfpisqZQDn3xW8W1WP71e7Sxl2Ot6QttdqyKr6
         ZhnPKhlp/3BGsyxCpYxGMHrZLFOSCp9Pbspm/aVEB8czE1jo/6Dg4vWEa51/FC334EfC
         uR5wkiv/Ii8M64/8O3dkSvApqIRGLdEm294uqv15i8xILaKePflf9Y4UePYyKNMTjBM3
         OuxlZsp69DJsA7zJdPzzT/VVaJNtRWLj/8n/T0QFFUeQknN5R/MWuRDRvxfi+f5epZgw
         gt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780504387; x=1781109187;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ac75VsX3g/JvZKVcVDB50QISY1fBI93TsemytCxfqQg=;
        b=Z5HZ/4Yk21RRE3hsFPdzYvG7i8eXZYkFTgu2JR+00CoGd16d1xxyLovJ4byAYkTlG0
         AQ2gCEmnzrMCe7zhXo3+7b/31q1Ragj7VkMBIzf5Xv2rK96/bvoxS7VvvdvKzt+Qaz/z
         otgCSFt9iln3WgTrJwbiRDQ5frbMLxzxY8T65TPK5VthUrhoEkS2+lXSxQL3gQJmHRoR
         TEs2h5HbyeBVN61sZ4sxYU8SNqDm8ueKN6gTKRBQ5ob9p5AoOa4xJL0UjUKMgdGgkT3E
         1IW7cLI1RPbp8/9nldkANfCXML2pEzphroayEscE17mCrqD1hSqXX/Lo6AamgO+4XDJ7
         q+Ag==
X-Gm-Message-State: AOJu0Ywh0dT0qRUDzOrL1e8AZTpP8D/PYSkQGqBhXV0tBfyNkdabOf8F
	5kjbqokJmsCEFyJ+DFEKH99IDIVg8uIHNP9UuqsiblRWPg+49AkBBC522ZpaWywI8CfJ32owVje
	8mgl8nly+UZCeUkaHnb5LIFsYIQyj55O5LXjIpiYHuo85v9jOOh552+Tj
X-Gm-Gg: Acq92OF2UMnxK8OQHaStrOOOmOEv/ojkc7pUc2wLuOlo+hNnAppiRQRNtfWA8wuxx54
	14xsdg8qfya9TZgf2SZjXvHHb8L4W132CG3CrmO3A9T0f4GFZiKEi66gV3xitzph+DFyHWQ6gxi
	VYXPgalJA6D17JVuRZcAGmBDcf10/iyHXcMItvGsDlfU7YYp64nGESMAb21MnqWI8FB53zFY0ts
	5hitBC6rPqws2sAJC+MlsG4NUx0xlV4R7fluXaEZ04hRr8sboXjoxx5Ektkl2aKawhcPMnT3t6s
	xA3492E38wSaIwSSnGRbj14PZtjwKcDNtDAclCML+HSZpNyHhQdwYIuAH5gq1IG1DGYeKQGnSmY
	89Q==
X-Received: by 2002:a05:7301:100c:b0:304:5a9c:644c with SMTP id
 5a478bee46e88-3074fb04f07mr2172446eec.15.1780504386326; Wed, 03 Jun 2026
 09:33:06 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 09:33:05 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 09:33:05 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523004223.446AF1F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-26-2f0fae496530@google.com> <20260523004223.446AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 3 Jun 2026 09:33:05 -0700
X-Gm-Features: AVHnY4JW2u1ZtWpSbetCl3rrz2ZqMMas87ECOInjSalJ6zcCgQyc1sNDL8XEXxs
Message-ID: <CAEvNRgFrCYEzX8jtbhwTj3qRqo-_CZ1=F_v9H231UC6uY86=Fw@mail.gmail.com>
Subject: Re: [PATCH v7 26/42] KVM: selftests: Add helpers for calling ioctls
 on guest_memfd
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The size parameter in `vm_set_memory_attributes` and the new `=
gmem` helpers was defined as `size_t` rather than `u64`, risking silent tru=
ncation of guest memory sizes on 32-bit platforms.
> - [Medium] `gmem_set_memory_attributes` invokes `kvm_check_cap` directly,=
 which incurs heavy system call overhead on every invocation and incorrectl=
y validates the capability attributes.
> --
>
> commit 89dd80303d47a776c6d340afaf265966a073bd73
> Author: Sean Christopherson <seanjc@google.com>
>
> KVM: selftests: Add helpers for calling ioctls on guest_memfd
>
> This commit adds helper functions to kvm_util.h for executing ioctls on a
> guest_memfd. It introduces standard macros like gmem_ioctl and functions =
for
> setting memory attributes. It also refactors supported attribute checks i=
nto
> a new TEST_ASSERT_SUPPORTED_ATTRIBUTES macro.
>
>> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/test=
ing/selftests/kvm/include/kvm_util.h
>> --- a/tools/testing/selftests/kvm/include/kvm_util.h
>> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> [ ... ]
>>  static inline void vm_set_memory_attributes(struct kvm_vm *vm, gpa_t gp=
a,
>> -					    u64 size, u64 attributes)
>> +					    size_t size, u64 attributes)
>
> [Severity: Medium]
> The KVM UAPI structures like kvm_memory_attributes use __u64 for the size
> field because guest physical memory regions can exceed 4GB. Since wrapper=
s
> like vm_mem_set_private() accept u64 sizes, does changing this parameter =
to
> size_t risk silent truncation of guest memory sizes on 32-bit platforms?
>

guest_memfd is 64-bit only.

>>  {
>>  	struct kvm_memory_attributes attr =3D {
>>  		.attributes =3D attributes,
> [ ... ]
>> +static inline int __gmem_set_memory_attributes(int fd, u64 offset,
>> +					       size_t size, u64 attributes,
>
> [Severity: Medium]
> Will this size_t parameter similarly truncate memory sizes greater than
> 4GB on 32-bit platforms, causing the ioctl to operate on incomplete memor=
y
> ranges?
>

guest_memfd is 64-bit only.

>> +					       u64 *error_offset)
>> +{
> [ ... ]
>> +static inline void gmem_set_memory_attributes(int fd, u64 offset,
>> +					      size_t size, u64 attributes)
>> +{
>> +	struct kvm_memory_attributes2 attr =3D {
>> +		.attributes =3D attributes,
>> +		.offset =3D offset,
>> +		.size =3D size,
>> +		.flags =3D 0,
>> +	};
>> +
>> +	TEST_ASSERT_SUPPORTED_ATTRIBUTES(attributes);
>> +
>> +	__TEST_REQUIRE(kvm_check_cap(KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES) > =
0,
>> +		       "No valid attributes for guest_memfd ioctl!");
>
> [Severity: Medium]
> The kvm_check_cap() function performs open, an ioctl, and close on /dev/k=
vm
> every time it is called. Since gmem_set_memory_attributes() might be call=
ed
> repeatedly in loops over multiple memory regions, will this incur signifi=
cant
> syscall overhead and degrade test performance?
>

I think this is ok? The part that concerns me is where we test for
races, like in x86/private_mem_conversions_test.c where we also use
gmem_set_memory_attributes(), and if doing open/close on /dev/kvm causes
false synchronization somewhere. I don't know of any false
synchronizations and I think this is fine.

> Additionally, this merely verifies that the capability bitmask is non-zer=
o.
> Should this perform a bitwise validation against the requested attributes=
 to
> ensure the specific attributes requested are supported, rather than passi=
ng
> the check and later crashing the test with -EINVAL from the ioctl?
>

This part is intended to check for presence of attributes, the validity
of the requested attributes is checked later.

>> +
>> +	gmem_ioctl(fd, KVM_SET_MEMORY_ATTRIBUTES2, &attr);
>> +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-gmem-inp=
lace-conversion-v7-0-2f0fae496530@google.com?part=3D26
