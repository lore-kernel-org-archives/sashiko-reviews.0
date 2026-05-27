Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE608221723
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 21:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779917240; cv=pass; b=liX4yOGQTgl8Uj0AveY8wMV3xNGk0BAAl7Kakl8QuVHJtvDUJsdb267fxFkMo+dN6RyeipQBo198kx+cRAEKKi9FTTfFPrOKKqo2bOHHSC008z/JnKleVhooqSz75IOywB92JaB6rw5lVXIOcV0wGdbIJjgOJSGaWc9mPwKlexM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779917240; c=relaxed/simple;
	bh=YnI+gBEK99o6JW7r8UYKmFh3L1HQLAgpd6bvG/HH9E4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6hL0iSttRg3pOdwXyQpkEB4CePGGd1NJ4gqpjHQ7+INbBeDXwz812CyyBCyPgAZtaipQ7gkniZa0MpvfhHsI2OmVoqkCbpv3i5Okz26URBOCaPgE7vy1X0C5IWFLcxpF7pzbcycKHgTYIiaWiBStv1eaTjzypvlcldkYSu/wBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pCymgf/7; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pCymgf/7"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137335bc3caso3125405c88.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 14:27:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779917238; cv=none;
        d=google.com; s=arc-20240605;
        b=jPCpJUB0BIFsV3PeENC6psXMLX2pd6JXiRpXQMXVQ/q0Yyc+Dy4NTwr6MA37eh4oz2
         gPMgWtuiG+QmQXRGt5L8JpwlZoAEAB3c2zsZU8OcIz5GYG14KB2YjR+GcJdx+P4dg71y
         drn5pP9RYiAwADAQwPyQL8cu10tktL3+L1mktmX+B/T9SNCTFcedaWljE8+IcxxDO5Sd
         gLQJS7gAM8IZBUvhUW+PTO54ikIgdRp0RycF03lUMg9t1KZOABVO0m2S8fyHiw+YFdh7
         ot0UGxTNmdvVvSkKIAuQXnsuZZzzDHyLzMxgGgYButYKdxSaywfLOQKTyfWblMBw0v7B
         YeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=F/ZuWO2enwzknvq47dPTMf2VsoYHccel50P0TNtM8o8=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=T1B3bNR8uTY4b4Q8haxUZKe1FvH3D+2/4UMV+YJqM8XBL76CDe4soT9SziYCA8SwqI
         2TvtJN1y29Q6S2dus58Dvv56pcr/5sXIIN/5vatQ0G4I16DKP1kkqaKgk2XbGrtm3WUZ
         sNAjl9hwFTdipBeafpgqFOch4rs/3BGHtGXTp8HKNpMoV381tLye4wqI1RqCf3xvI1Cn
         WpPGZo8khyVn1/VXndUlwiTyBRz9DVtFfte46CvydRcYrYJ9UFgSoBb00db0Tl3sOdUd
         QnUq6VubYS6IdkuAqPp0/9zfwLSv4LUlabYczCcvtZeBKO9Upldiw0rZf6rLcY6DhljG
         MZ8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779917238; x=1780522038; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/ZuWO2enwzknvq47dPTMf2VsoYHccel50P0TNtM8o8=;
        b=pCymgf/7wyLaFO5e87KaYZSVcWy9KAZ7mdqGM9tDnrdAJ3osNMv6xuDaMGQS/TGg7Q
         15HU2umezs+8YhUyFDUKzhVGZkJnjQKXBEgopOKqw4TlGoksoEXvxiX7i7+AR2XlKNxI
         K9jk24By8gn36pQRGQh9/8kbXAxFBTF2uWHpyBLW4I2Dpj+qJARE74JTRqPc0l0dENBj
         NIgCq1dp/ubhmOyNkVniu9MqRNmwYVXXPc4Abp4HmtKkdZb+iSm96SAqyXma0+XYFckn
         KwBc3X236ID4Z/z2V1ot61FRY7Wjx5/BhxsEskhwkRkbcJeKe0NLkTcSyzxuwALP6dMu
         hL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779917238; x=1780522038;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/ZuWO2enwzknvq47dPTMf2VsoYHccel50P0TNtM8o8=;
        b=Z6ojGrbgwkC5ev/f8+152EVITCjDrq39x0l5ftjvc29KfS6uiOjYTwoY4mgF3jMBw/
         EbG9i18mg6lJwGlG9pJVjSqdGIa4QCYCT5aI0cSqm94HcTNao6+B95zeJlX1FLfW0CDq
         2xriSzvjQNsa61yIxAAi+Rm06hTMezUYphetD1Ecv4t27k3ZPTKqcgxu5pkxgyZVowh0
         FkcMRihra0RBFRUwRt15s3ZiBNA+bTjtRir+DC+ZaCdQ1YAb+o1yWMV/NWDusm5plBb+
         g5UizfRR/qiORk26DUCnoRNvoLGe7DLsCTkh/9cqdTitPhzN1PhShMuWpR4dJDyg2VFK
         mT+w==
X-Gm-Message-State: AOJu0YyYGQOMnQ9R7Odh8zPrXzuoJ0hQ70cd9o1c8N7kz11cQoCQ7g3l
	m4rKr4n7TA98nNlRu08YeKLDw74/XXIFEK26VTK60u7hQhWt/kI5anvASdZdqHarXhCI0T6y0gg
	G4AvK7cX6hlgTmYsHMdMEdfVek9hUX89BHVBiLB4ZZnC2Hp+/UWdBsrzg35A=
X-Gm-Gg: Acq92OF2mgbzL9XQV5Z9eGTITP3uJg8fkVni6+MOyDB6pZoNZ5NXoaXN1e4gEIJboxm
	C2pNEFxHIfDZrBi4Rh8mpzsmusldHU5fdaAth1aUsKgtuPqOmhfxeAT/X1ujXU02wNuwpfZC/Dp
	Adk2R9iBgtszdF1EMCj19NcgcC/rei2fHcJ0FfPjFkEabzTx8f/5DvaBgaZEYAekJUdJDHn8T3w
	CxpuKfWxiTNvBul85nu3HuKUKiVVhsFSeU9woF68dY8psK+xUmTd5KXoYxclblOnEggZD4osobg
	Y5h9/TEGtGSL2YX2mpnRaK6xz0Z3lCkSZokRjU45QahrjUFqvMowI/28ypu5Xm301xWqTK3L159
	gjzMscjLBHFXbAQ==
X-Received: by 2002:a05:701b:4244:10b0:136:9ebf:3bf4 with SMTP id
 a92af1059eb24-1369ebf3db9mr4977619c88.26.1779917237159; Wed, 27 May 2026
 14:27:17 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 14:27:16 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 14:27:16 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523010158.085871F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-9-2f0fae496530@google.com> <20260523010158.085871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 14:27:16 -0700
X-Gm-Features: AVHnY4LeWdNVBSqlhgtF97xpl5nV7Ce8VnbprWBkeoyFHrkHdvIBUib30cljI7c
Message-ID: <CAEvNRgH9H4o_Hka0fazB9vpPB0FsxWJkzhjEK59XpWeg+d2Xuw@mail.gmail.com>
Subject: Re: [PATCH v7 09/42] KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Missing .compat_ioctl for guest_memfd file operations breaks 32-=
bit userspace.
> - [Medium] Silent truncation of 64-bit memory attributes in maple tree st=
orage.
> --
>
> commit 49c89936f50d0c8e067175446db94838144dd770
> Author: Ackerley Tng <ackerleytng@google.com>
>
> KVM: guest_memfd: Add base support for KVM_SET_MEMORY_ATTRIBUTES2
>
> This commit introduces base support for KVM_SET_MEMORY_ATTRIBUTES2 in
> guest_memfd to update memory attributes. It defines the new ioctl and
> its corresponding struct, allowing both read and write operations to
> provide error details to userspace.
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 4f7c4824c3a45..91e89b188f583 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -540,11 +540,125 @@ unsigned long kvm_gmem_get_memory_attributes(stru=
ct kvm *kvm, gfn_t gfn)
> [ ... ]
>> +static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start=
,
>> +				     size_t nr_pages, uint64_t attrs)
>> +{
> [ ... ]
>> +	kvm_gmem_invalidate_begin(inode, start, end);
>> +	mas_store_prealloc(&mas, xa_mk_value(attrs));
>
> [Severity: Medium]
> Could the use of xa_mk_value() here silently truncate the highest bit of =
the
> 64-bit attributes field?
>
> The UAPI defines attributes as a 64-bit integer (__u64), but xa_mk_value(=
)
> takes an unsigned long and shifts it left by 1 to set the lowest bit for
> internal pointer tagging. On a 64-bit system, this restricts the usable
> value to 63 bits. If an attribute ever uses bit 63, it seems it would be
> lost when shifted, contradicting the 64-bit UAPI contract.
>

KVM_MEMORY_ATTRIBUTE_PRIVATE is the only supported memory attribute
now. Let's deal with this if/when guest_memfd gets to bit 63.

>> +	kvm_gmem_invalidate_end(inode, start, end);
>> +out:
>> +	filemap_invalidate_unlock(mapping);
>> +	return r;
>> +}
> [ ... ]
>>  static struct file_operations kvm_gmem_fops =3D {
>>  	.mmap		=3D kvm_gmem_mmap,
>>  	.open		=3D generic_file_open,
>>  	.release	=3D kvm_gmem_release,
>>  	.fallocate	=3D kvm_gmem_fallocate,
>> +	.unlocked_ioctl	=3D kvm_gmem_ioctl,
>
> [Severity: High]
> Does this missing .compat_ioctl handler break 32-bit userspace?
>
> Without a .compat_ioctl handler, 32-bit KVM userspace tasks running on a
> 64-bit kernel will unconditionally receive -ENOTTY when attempting to use
> the new KVM_SET_MEMORY_ATTRIBUTES2 ioctl.
>
> Since the layout of kvm_memory_attributes2 is identical across 32-bit and
> 64-bit architectures (all members are __u64), should this assign
> .compat_ioctl =3D compat_ptr_ioctl to ensure API compatibility for compat
> tasks?
>

guest_memfd intentionally only supports 64-bit.

>>  };
>>
>>  static int kvm_gmem_migrate_folio(struct address_space *mapping,
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-gmem-inp=
lace-conversion-v7-0-2f0fae496530@google.com?part=3D9
