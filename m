Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAE844605D
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 17:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433430; cv=pass; b=EsQnmImKVXQF3UCuhdrtZgOgJUv8ialN0yj57Idmx/HEtcIr0r1+6EpUHNcuFwpWbs0dVo/a6oEva3NHrOMxMLQnoo7wtFp/D0Eg4tUjIa/Ca2TQd6frXtT0e5xTu1RkHJ+cj1w4l206X+ETeSx++mXLUGT3nNFeG6BQoqdZOpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433430; c=relaxed/simple;
	bh=OlBwlhKOiCMRiIdYne4F/M0ahn6Xw3rouRdmpnSET1s=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWskRcU/P6KR0Zp7YDA64HQz59ALuG+WlJjejIUWMpfie6WK1S/0ho6P2bQ/p5YXFdqbQVappOcYq5OH5NO0kWA/d+2CeNDRtzvlWaH60BFWy9Aue/CQ6GviyoD1SFaMOBD+Wujk7gkkVhLTzsK8Qrw7lFcnPY7XkfCOHmK5LVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=flZkQY2N; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="flZkQY2N"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so126998a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 10:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785433427; cv=none;
        d=google.com; s=arc-20260327;
        b=AXxML7r+jtLWU1V4UGzDg2wXm/hxsP1Zpr/f5Oz++zv3GoqYvN8EuKlyh2z1OVkb+3
         5UPRfdmUKKjq/NM3evzFqFCzReCtVnQmD4GZG0rkkdMQO0g4ZhrZo/C6Tvw9l7sLjjee
         Pt3tqiAYGsTolFcc6YV9qNs9JhWI29dfG5Fv/EerhaMVAoLIYC1XdYX7uSXe2Z89hpHO
         NwQP1zDTSOrBXl/ehwYPt0rrq2rt0vL6jE+s7GHgpsZAbILkK1VkESHGEC8mhhnivBgR
         nvQ4JUm4i9vrxy2N16HnSQ3k+ek0vZfDfWX4M8q7iyqKfsctcF1Z6z3khlTBTjK7xbhx
         Z0vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=63PGhmBtUzf4vUZbWnyFr9JI9DJZU2NrWkZa1qKZ4cY=;
        fh=UovrO0TvLiqRHU1kp7Fq/+U56YUYq5jh58TPdqHXeG0=;
        b=RyMl2VXsR6VUT1G/McN6lzdklLDtPgaa+7uJ9csmj7bRIIRGztw5d35nH+QMt/jfLK
         +c8utQcQVhuW1Qo4b1Au5SCCakaAgb9HHl92g5i0qODdhk40qbpqZcLo5IUAriV7QS1J
         zA83u7gYLEq5u1HeSwKR5Sdt8y3o8UzTTEYAHrs/3nup4WKVBCn7u3GjtNl8UzB3+t86
         iR5ZPn1uJrBeI+mplhKKvhH0LiRspitIA0zhvbnloPl+c8kHanPu+pNcXiM0bsAQ697+
         gp+5cOUpi+d5v61LSlHBmjS+PYb5Pgq+koheczql4myBVvCAjPhsVEWvWg+S4di5ON0g
         eK8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785433427; x=1786038227; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63PGhmBtUzf4vUZbWnyFr9JI9DJZU2NrWkZa1qKZ4cY=;
        b=flZkQY2NWYDrXrtXEspRyWNlUfPcF3jhZSn39uLUaC8n87ZQocw4NVAlWQXGLBZ7aE
         KKfDWKfu44CLqkV/7pgFza2Vt5RloXCR8IR7DrwhZWeqyXWIBMRDvIk9qItpqDmo+E5I
         GlF7WUWhMl5BMHeX4RxDVkl4Lk3UOPekgk4Chnzqx2+DXlwmHUnHE4rd4CTuCYQeSW1W
         VGxnNnQb0dhEAwZakWUUpeQbFbQgDdIbr8KW5yTcAnCtrEizFVpW+ybTNk+MeQBdKR9g
         wrP5TliBq7IIMVSZArln2aMn0WVYOwfoyOHFd2nzWez3+8/EaPhWY9+PsLK25rObb2iO
         jXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433427; x=1786038227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63PGhmBtUzf4vUZbWnyFr9JI9DJZU2NrWkZa1qKZ4cY=;
        b=CPE+0/aV/etZEEPmOdb5Q0jvoTWd/EPnnvw2OQwOSEeVuv1ngg85OG2WIaAyexuE0r
         v3BPUUwZlWY2b3lEgRPSbam41mETg2A9ZInCG3h2YkFEiY+rTONyFb3kOR9ksi9AuBUd
         B7jmSZ0uiK0mXJKz6EtlK5d3fYuhvT8UPcX0lET02CgAsqC3743/tJ/N3ieLkICwV1FC
         WbH/aF9DbGYhazVUN7FIoRpGitCw85mg8ZkIxrpBxHGdiGJGvf2ub8JIhAGUHfnJrQoF
         GvmBqkfnX4tS9Y3/ujVQampi3WC20xn7+a/9geQMv4McqTi3vI2vShPdep2CJMRArQb8
         X0uA==
X-Gm-Message-State: AOJu0YyoMZJRShJvaoKRVUMdIuC6kr84XpqAHk0BVr+q4WnEPfgNReWa
	Cgct3QKRzSgFoo/En+LAv8LT18oQgr9amM9eoot7Sx/HXtV4ckVp2SYhcLhYfxB7PYcOFLjP4iD
	0ZkQRGYqz3jZ6IwrCLIauyzgzrxFGa09IolXvziej2cCU4GXtup+Wv0/Y
X-Gm-Gg: AR+sD13SZsfEKO/Jfh0YZUQ+Syvrx6n4sm2/1qmfLHBh4q/1zxFtisFdcGuLDmsbdGS
	HHKeq6hJ4Tpp+2jb04ZpWMa6gUDFIsZ5fBKDOXOMbFmZKqf+D2FDcKTe4U06WC1HV88z4DSGXHy
	2sWVAxn2PdnJf77UML89mlOSB+6tCY25rP22pZXptT/3o7ze8XZt5pETDKvNe8/YWzeJQMKcj+Z
	lmn50Bumo6TGRXDZcgQYi50ODLp+uU/nYAWMz1jCkm1luviTcx8iUSzZeQtgFBA1CmrJCqd1fLF
	xFHU0dIf3iRfuCb7ryOElsf3gMD+RpBvquBiWfSXWdlepd1OtJNxbbyYD3qP00Vz8UxZjwi/CSl
	UNQjgOYUHlrktWLXaG6pOrmKrETMVocthi8/xSedxlgEL2A==
X-Received: by 2002:a17:90b:1dc7:b0:38f:240d:b857 with SMTP id
 98e67ed59e1d1-38f9bda5d44mr2890773a91.2.1785433426437; Thu, 30 Jul 2026
 10:43:46 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:43:45 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 10:43:45 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260728122655.17C791F00A3A@smtp.kernel.org>
References: <20260728121138.1103610-1-tarunsahu@google.com>
 <20260728121138.1103610-4-tarunsahu@google.com> <20260728122655.17C791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 10:43:45 -0700
X-Gm-Features: AUfX_myKuoszqFvWeEwTloNt1W9Hm9CCDiUlXfsqzDGDzLiGRc2fM4YKO_l1eUo
Message-ID: <CAEvNRgGDhcu2LUqhwVtGJSUo4uXQHrGOYRDaM2qzPTO4LX=jKQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] KVM: Export kvm_uevent_notify_vm_create()
To: sashiko-reviews@lists.linux.dev, Tarun Sahu <tarunsahu@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch claims to export `kvm_uevent_notify_vm_create()` but fa=
ils to include the `EXPORT_SYMBOL_GPL()` or `EXPORT_SYMBOL_FOR_KVM_INTERNAL=
()` macro.
> --
>
> --- Patch [3]: [PATCH v4 03/11] KVM: Export kvm_uevent_notify_vm_create()=
 ---
> commit 5e642ea16f0d267e622a352de60bfe397ecf79df
> Author: Tarun Sahu <tarunsahu@google.com>
>
> KVM: Export kvm_uevent_notify_vm_create()
>
> This commit exposes the kvm_uevent_notify_vm_create function to allow
> triggering KVM event notifications during VM creation.
>
> [ ... ]
>
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -6348,6 +6348,11 @@ static void kvm_uevent_notify_change(unsigned int=
 type, struct kvm *kvm)
>>  	kfree(env);
>>  }
>>
>> +void kvm_uevent_notify_vm_create(struct kvm *kvm)
>> +{
>> +	kvm_uevent_notify_change(KVM_EVENT_CREATE_VM, kvm);
>> +}
>
> [Severity: Low]
> The commit message mentions exporting this function, but is it missing an
> EXPORT_SYMBOL_GPL or EXPORT_SYMBOL_FOR_KVM_INTERNAL declaration?
>
> Without the macro, won't dynamically loaded architecture-specific modules
> like kvm-intel.ko hit undefined symbol linking errors when they try to
> call it?
>

I'm not 100% sure about the use of EXPORT_SYMBOL... here but usually I
compile kvm as a module to try and catch these types of linking
issues. Maybe Sean will have a better method/explanation for this.

This brings about another question I have though. How does luo work if
the new kernel's deserialization of the persisted data structures
depends on a module? Like in this case, KVM is a module, if KVM isn't
loaded in the new kernel, do the data structures stick around until KVM
is loaded? Or is KVM required to be loaded as a module in the new
kernel?

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728121138.11=
03610-1-tarunsahu@google.com?part=3D3
