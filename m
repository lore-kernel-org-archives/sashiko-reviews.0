Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D4F3DC4DE
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368086; cv=none; b=PYXfL/nJg5e1RUg94WIwaiX3ssy7bExWVGJ8drsq2yuUz7z1/z4WfN1hF//EJYTOgZebzTiTtpfF+cJHgS9VjnpUV76sQZXl0fl3AKRUja6GWEQ5ThqPVfDv2vjd2UV2zP6Rh1on2zZTvsFUDdCRQ+g9CcQxR0Pc/jHGr7ZCv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368086; c=relaxed/simple;
	bh=Jritruhw88V157bsaVjUyVKBcWQHYkBHQchXkcJBv5s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YX7AWlc7L5e6UG/hFiwm3oIrLADPlvWQuD2h2Z/Qk40T1LMIGdcFH5XvAYgMWTr6f1LtNskpgyzXOmdkuBJzIm8FB56Tm2Tcj7Bvy9nOv440dNn7o4h0ccMMmAr8e26frV7IWRQGlWekWuLOiT9xUmKaLLCJfaDV5PqtetKkRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CbR/wRsT; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CbR/wRsT"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-496bbcf7d1eso13108475e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786368084; x=1786972884; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NUXsdBwMwxI/nd8pDWWxjP+P4ja3jy+HCgssAFJhmgg=;
        b=CbR/wRsT5od2T8ZzVx6vT+CvheVXxQxC7tuL1N/aYTl6eYPFe+8J9VPDnIiET2CGuk
         jcK0zxTUynLI9vv9uGObHmxaoMGV3gh1Zem0QCjsAqwcJP8Gkng47ZEtYVI+hGlgDOaf
         8NCU6HQbMSytbIHRRBrxukvH6EA2LCSsVW5RJbw43fILkNzswzk9CLaV19hNopfmLiFU
         6fD6tjURuXKtCerINrYxcg+gh+ATpxSFbv0Lr3lC7d8UtXvmyBPkjFplxxR6sUmfQAtw
         7oz+FcWATk+Kjn7OOKLcoZq5dprGH6XYmefO2ep5EUJegxW66SbN3BXW3GAiskUi1XQB
         bSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368084; x=1786972884;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUXsdBwMwxI/nd8pDWWxjP+P4ja3jy+HCgssAFJhmgg=;
        b=Bk6ER8Dp/92qsOCh+6iZ26LA2dSNaq2QTBgjC+vF8eRGF2lXVqVr5NYJhpph3gZzu/
         XWf6t4F80jAaofMrbdz3kzCxTLT53ClKTITmecKDndTBxZCAV/i552xosIe63p8wgksN
         Ikb6UsPhNqUqXqrrwOJM8+qB+dE21Q6PNN++RH6FrWGyf3pLBOaW/fNhYuw0hAZjxSxe
         IHMaHBfSo2d4GckspkxRjEVdo/2tI2FUe8SRiV5wmKuvuR+ViCij2gYPN7NninyWyJ6b
         NNqK+dt3iPWGE3YsK/oWMkpFqmv+TJsfVhn693LV891OP9BOGYKQuQAZ9fDLYom+zU8F
         1G+g==
X-Gm-Message-State: AOJu0YxRXECY3oe+LoqTZFlsWz4N+GOgHdx5JY+dK0srR01t5gFvPYpM
	QijmJ237JoPPiQizd86S9ODMIozqgAIdGQUTkNDwojr5xKkAOV6qAAYTyJNIWSe8RdrmkpghjWK
	MR88ncw7QLQvoht7xr8JMXi1HjmkUEys4DgbJu4tYRpw8T27Ory2GwflRYd/JROL8MAMKZEa6T+
	9JCnqWelsu8hzp305oejBLVoWyiUY6yWitGBYfBqQy+XHjG7uzAztzqQm2mFZS6rPP
X-Received: from wrwl10.prod.google.com ([2002:a5d:674a:0:b0:47d:fb5d:6130])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4715:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4996195884bmr227828785e9.5.1786368083378;
 Mon, 10 Aug 2026 06:21:23 -0700 (PDT)
Date: Mon, 10 Aug 2026 13:21:22 +0000
In-Reply-To: <20260728122128.D0E831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-10-tarunsahu@google.com> <20260728122128.D0E831F000E9@smtp.kernel.org>
Message-ID: <9huzy0ee6rhp.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 09/11] docs: liveupdate: Add documentation for VM and
 guest_memfd preservation
From: tarunsahu@google.com
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Mismatched kernel-doc section titles cause Sphinx build warnings =
and missing documentation.
> --
>
> --- Patch [9]: [PATCH v4 09/11] docs: liveupdate: Add documentation for V=
M and guest_memfd preservation ---
> commit a930d2f58a9edc06bdcfd10fb383e97d7fe3996c
> Author: Tarun Sahu <tarunsahu@google.com>
>
> docs: liveupdate: Add documentation for VM and guest_memfd preservation
>    =20
> Add Documentation/liveupdate/vmm.rst detailing VMM requirements, scope,
> ordering constraints, and kernel-doc inclusions for KVM VM and
> guest_memfd preservation via Live Update Orchestrator (LUO).
>
>> diff --git a/Documentation/liveupdate/vmm.rst b/Documentation/liveupdate=
/vmm.rst
>> new file mode 100644
>> index 0000000000000..b8e8fb2b63c21
>> --- /dev/null
>> +++ b/Documentation/liveupdate/vmm.rst
>> @@ -0,0 +1,107 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +VM & Guest_Memfd Preservation
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +
>> +.. kernel-doc:: virt/kvm/kvm_luo.c
>> +   :doc: KVM VM Preservation via LUO
>> +
>> +.. kernel-doc:: virt/kvm/guest_memfd_luo.c
>> +   :doc: Guest_Memfd Preservation via LUO
>
> [Severity: Low]
> Does this section title exactly match the DOC: title in
> virt/kvm/guest_memfd_luo.c?
>
> If the source file uses "Guestmemfd Preservation via LUO" without the
> underscore, this directive will fail to find the documentation and genera=
te a
> Sphinx build warning.


I will correct it. Good find!
>
> [ ... ]
>
>> +VM & Guest_Memfd Preservation ABI
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +.. kernel-doc:: include/linux/kho/abi/kvm.h
>> +   :doc: DOC: guest_memfd Live Update ABI
>
> [Severity: Low]
> Does this section title match the actual title in include/linux/kho/abi/k=
vm.h?
>
> If the source file uses "KVM and guest_memfd Live Update ABI", this misma=
tch
> will cause empty sections in the generated documentation.
>
> Also, should the literal "DOC: " prefix be omitted here? The directive
> typically only expects the text that follows the prefix.
>
>> +
>> +.. kernel-doc:: include/linux/kho/abi/kvm.h
>> +   :internal:
>> +
>> +See Also
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728121138.11=
03610-1-tarunsahu@google.com?part=3D9
