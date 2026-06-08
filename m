Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49533321D4
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935214; cv=none; b=X0qkhsOhxysTu6TRgSUeHSVQvBtM3otj+GrkzvINbSpjaRIabN8kYCNix2JFqUVJkkVGmGuabO8cjDA3XgnDoDl56iSA1vYDgwnRs2wMVT/hTHFU/3eNSG4L4iSyl+Amqmu1UerkqN1q/llEYTF042CkrT/+6L35lbtgjhvOwkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935214; c=relaxed/simple;
	bh=n2pFqhOeZHDe/xMcy5agbg/pMto8LhEIEHQ/6wijhlc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cWtXXQmYa+zEAXxlphx/xwMLgLy9iU6x5bSdyTc19VTJDY90qt8SCmKjFkXoYAp5mA6p0dSyHmQWcyi2yyz7aV9NIFWc5X8NjyDrhOOo7zIADVHIwz17nKdzZXODSu8KUnbeZ6/mOcFml283HP6weW4EvKdop6oa+1qzIAGd5j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SMILbPPG; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SMILbPPG"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-67e32a60b39so6453142a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 09:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780935211; x=1781540011; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xL7fKZb0tbUDjFUdPWFnb0YOE1teoOM2ki+nlFuHpDE=;
        b=SMILbPPGALmUx0xV4iesGnhb7ZqV67fXk07PYEQM5RrqdyGCh6az/ADiwC4tw4c3b9
         bZEhgOVQgI37DYWZVdLjnDzfs6X7RGFQvmfcqYNMKI56BZ31de3Q8QSt/iYv8NO9QDJh
         p8an05V+N47ZfqNfz1sM212KTv+Q0y4y7KWFBT33Hwisl2C3BrvkBZbfl8iXOWTDJegs
         DJa59pDWiyr/nwbPpqfafd6JD/NsdUkvglp+ROiZ+l530pg0xHneLysLl5KmbewygZkB
         p8jcTt+fnify5FNswx+4KAnPtwdJvZacxiVjyJr9mk1BQzhxvUKcIBNmW6l8a1Zwe7ww
         robw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935211; x=1781540011;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xL7fKZb0tbUDjFUdPWFnb0YOE1teoOM2ki+nlFuHpDE=;
        b=Uw8Nh4FHHQpNDuMoKkGAnr+ykP1jQo5dQNwpYOjsbwAmO8Lq8ot2Pk2ZKyGJrrNsAg
         Qq/J+aNOT1zyziREspqEhab4SuUJEGf2a9mnQckb5Olq5i/0JrwTPGfo9CJDHZaP9fqa
         13AeeS+u30boFpunT9vFsclHt7QujuX7aIr4YF7CKyP1Yjx2iHaPO1Dm0kT1SkVN8AAf
         Qec8Ka/fgdCMhWKcBc5+MrYPsxMYDNgh/8yIe0mqE9se5fGBj8di3kde7OavWo8HRtTS
         GxgcDuB5viAMfECBrd6bvIYq93Rjykf/ywnXsFqOTaK/9byJx0Ggv5NyfPjPM75Pp3wJ
         hyeg==
X-Gm-Message-State: AOJu0YyFgZilMn5RJTxA7Nus22UUcq8vKmGcyxnMbPv4LgbdU+KS75L2
	6DqXFNZOpjt1zxB4X0NME3h989d6h+02XCPkU/bC8QUd2iRHfqZlTGvg/jQIfvHBPKCQ6IY16z1
	40rkcwb5D3F1A7W9EqIrBBdTEctAB0OWjgs+1fW66J/riwqVPxgHmuHHwQVVL30x8qP/uhx0Yg8
	Q8VvnlmifbVp2ZyBvaG+G905U6XcNTyVVxeP3bKzepqucFHHEu/4lyjlLvAkqJJbCF
X-Received: from edag15.prod.google.com ([2002:a05:6402:320f:b0:691:acc4:471e])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:12c1:b0:691:6fb6:dada with SMTP id 4fb4d7f45d1cf-6916fb6deb3mr2797490a12.4.1780935210801;
 Mon, 08 Jun 2026 09:13:30 -0700 (PDT)
Date: Mon, 08 Jun 2026 16:13:29 +0000
In-Reply-To: <20260605172634.95C811F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <8730c0e11acbd0d645a8b7187cd5cd7de373380e.1780676742.git.tarunsahu@google.com>
 <20260605172634.95C811F00893@smtp.kernel.org>
Message-ID: <9huzbjdlxb6e.fsf@tarunix.c.googlers.com>
Subject: Re: [RFC PATCH v2 04/10] kvm: kvm_luo: Allow kvm preservation with LUO
From: tarunsahu@google.com
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


Hi,

sashiko-bot@kernel.org writes:

> [ ... ]
>> +#ifdef CONFIG_X86
>> +	ser->type =3D kvm->arch.vm_type;
>> +#else
>> +	ser->type =3D 0;
>
> [Severity: High]
> Does hardcoding the VM type to 0 on non-x86 architectures discard require=
d
> state?=20
>
> For instance, on ARM64, the VM type parameter encodes architectural
> information such as the Intermediate Physical Address (IPA) size and
> protection flags.=20
>
> Will restoring the VM with type 0 cause the new kernel to initialize the
> VM with default settings, potentially leading to a mismatched memory layo=
ut?
>
Ack. Other than x86_64 arch, vm_type field is not part of struct
kvm_arch. But the type is used in creating the new kvm which we will
need on retrieval path. Currently only ARM64 supports the guest_memfd
other than x86_64, So I suggest the following:

-#ifdef CONFIG_X86
+#if defined(CONFIG_X86)
 	ser->type =3D kvm->arch.vm_type;
+#elif defined(CONFIG_ARM64)
+	ser->type =3D kvm_phys_shift(&kvm->arch.mmu);
+	if (kvm_vm_is_protected(kvm))
+		ser->type |=3D KVM_VM_TYPE_ARM_PROTECTED;
 #else
 	ser->type =3D 0;
 #endif

>> +
>> +static atomic_t restored_vm_id =3D ATOMIC_INIT(0);
>> +
>> +static int kvm_luo_retrieve(struct liveupdate_file_op_args *args)
>> +{
>> +	char fdname[ITOA_MAX_LEN + 1];
> [ ... ]
>> +	snprintf(fdname, sizeof(fdname), "%d",
>> +		 atomic_inc_return(&restored_vm_id));
>
> [Severity: Medium]
> Since standard VMs use their native file descriptor numbers as fdname, an=
d
> those typically start from low numbers, will this auto-incrementing count=
er
> guarantee namespace collisions?=20
>
> A collision here would result in a duplicate directory error in
> kvm_create_vm_debugfs(), which would cause debugfs statistics for newly
> created VMs to be skipped.
>
Yes, I agree, I have a comment in cover letter, Would be happy to
discuss alternative, if this is really an issue.

>> +
>> +	file =3D kvm_create_vm_file(ser->type, fdname);
> [ ... ]
>> +static void kvm_luo_finish(struct liveupdate_file_op_args *args)
>> +{
>> +	struct kvm_luo_ser *ser;
>> +
>> +	/*
>> +	 * If retrieve_status is true or set to error, nothing to do here.
>> +	 * Already cleaned up in kvm_luo_retrieve().
>> +	 */
>> +	if (args->retrieve_status)
>> +		return;
>> +
>> +	if (!args->serialized_data)
>> +		return;
>> +
>> +	ser =3D phys_to_virt(args->serialized_data);
>> +	kho_restore_free(ser);
>
> [Severity: High]
> Can this result in a double-free on the successful retrieve path?
>
> In kvm_luo_retrieve(), kho_restore_free() is explicitly called on success
> before returning 0:
>
> 	args->file =3D file;
> 	kho_restore_free(ser);
>
> 	kvm_uevent_notify_vm_create(kvm);
> 	return 0;
>
> Since the retrieve is successful, args->retrieve_status will be 0 here,
> and this function will call kho_restore_free() again on the same
> serialized data.

This is incorrect: retrieve_status is 1 when it is successful. So this
review comment is incorrect.

>
>> +}
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780676742.=
git.tarunsahu@google.com?part=3D4
