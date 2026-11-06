Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793941944;
	b=OtdUyr5iEhAu6qtZ22ztVKO/i0vJEEs3QcFcMxABYl23gGTng/nlac917zlKcWY+9IC/
	 LMdqrVehd2lMTMZ/vhaRmJxQ1FNzb0cwoaOOnT7xGM+ALVbrCmJTtO9Unlfajh9I7cg1K
	 UOxbAy3gBiG6LJOwbw/fKLb8XcEowBlmPtBWTLUFGEctNSkTyVgO2MyCvIALZiTBkdueI
	 gCI4FGNHGd2jr/hNMilzGvk2MSo7eoH2iEO9/8yNDVRgu1iIf9UhPWDjC9Wx2/gBcmShk
	 3XuTTY2LheAXWs4TnVMpcc4Oz9VYyWUv76aV3k+jTMqpsKFLkL1YOpAeP33DWp1dqZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=L0E8qwKq9tI0TeHTVwDsi/hq8uyC0B0sTmXnOqBK0ms=;
	b=wd6hBCL1dmasl7etIhy7PzzaZPfQRWts/P9QJHDNFa9mD0v2WiAF0NpthtxP2EiYh5KZ
	 +7IyirzGA5FRsZVK/YQRcUPhSzVubqM8Wk3fc1xIQbuPu1/fS+bqr7QyL/lxEOcUWCH40
	 khXpGk0B+bzVWCw0QLWOQl0mL2eQbYmhdUjMCBpf/3xzYh/kmydahYKnrYqD1LHxbaW6L
	 oFY36c14WfN6OBgcVOitUNFe/whaDNbtMD5CQ8QtOIeBBVsIpSlwh64BZ4hVbvvA9c1SY
	 /sA0PmHP46cVqfdLOSMq/2n0gK7EqAMnbVq2lih4KzTjFDAKFMsgtCqLvUbSc22qLsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G3rwlP4E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE60606A326
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 05:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE60606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G3rwlP4E
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so929a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 21:12:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941943; cv=none;
        d=google.com; s=arc-20260327;
        b=cv74FocXi8UlwOKzO1yYL1oA42RBYRmdGlMh5Sy43PKMFYzuzqgOGvIczigLOAlql7
         FyiAJsYOcHixUo1GTBpacnj1MBTBy8oUoLkuu8CkJ5GjYD2PBxjYdnaSjW4yKTBaGVV1
         lugmqZ4YkMqSHrxPNj0E//uUr1wRWLahLXKWBuWmrbRJNxt2ZV4ttAras5BADYWU+rgu
         r/5RnCXJjzwNskaS2+IN+j1ikLnb+WpfMGrDV0iBrvQ4iZlVzEya6kfLjhKTkZ2LGCrh
         d0+wLkejPHQFa2xrORcX/h9lTzK/fCBHXCjjVHQaX8BHyi/JGv1Nof817kVDPcUPtKUK
         sw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L0E8qwKq9tI0TeHTVwDsi/hq8uyC0B0sTmXnOqBK0ms=;
        fh=nlkyPUp2r2LWvw5k35dW+ysIlz9psoez4cokmdqutLw=;
        b=nGk+8mqdHNnBw21ZScUSvXZCmvUfI1/a7gM6KouX90GRqInUYojlCiRmiTdwBwaMKy
         HlzvGCmoQkj155jcAVexjEefkvzVnGkTSN7wrFjch8TlQ0Z0891NrGPPVG0UqeHzd9w2
         dl6t3mgEe36oTy1CWv0kKIzJjArC0KOXLsPsI5ZeT3GNCHYdBdVnsiWOJVNNCiZ51VEc
         vEsUFKGPjIHsRfT7h/Jmlh9fRjQPfJ3wph4VzgJ42J5f/wxcINDAW7Ruc+8N+JtFMDX1
         00QWy9dO82vyRuyXCv/FQu1BEjBB0nCKCBFkfCyEG7/mButMkUF2QjdHDY9/gPe38YuR
         F7iA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793941943; x=1794546743; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L0E8qwKq9tI0TeHTVwDsi/hq8uyC0B0sTmXnOqBK0ms=;
        b=G3rwlP4ECs2m6qsUzhJ4eT+tNIbUevSt/EcBeGaoSAsM4LS4HmbyGuaNDbZZ1O7Y1+
         4814cuUJitcoJ0JB921XSWlyayfpYuwyRLneI91M+UHc+ZREQNWPVtU1qx/xQAhfKgLp
         nFgevhiI8d+JW1xVM2Us4XzE2o6CE+Y0afiFtik7g6EkMHhPUjalWEjdK09b5TSRLLyG
         vlWorGmKTUqdaJ/fX+Nbaxc38f0s73X/mP4kTMIsbCxEGR35gOvSc9uk/Id+/rPe0ni/
         d4Vo0h05KoxLhqOsAvQYNUvCeQPA6FgVKzpNJqPB8AvJEn1NBHFimb3Jcbp33BRUkgh+
         buDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941943; x=1794546743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L0E8qwKq9tI0TeHTVwDsi/hq8uyC0B0sTmXnOqBK0ms=;
        b=Xm1gArW47J4hPyvenXv5CGLGgnOHjRPKEypg3hWJV66qdvrCS+TxMFd82h8sgUWAJo
         noJ2r9wzS+qz8oHAJ4tY4c6rnLPczAH44Xj9OIwuMHRjiFK3TBeAn43/phoFZnfJXx0s
         HBPoXDF4QUC+lJ+J5jnIjoo211Zl0nmcc2q7/Z6DhyQABgWK4owX376Qe0Wn5JBqbB5u
         FiTuHdBQqDZlcqIbqvYiDd+tEUnQKuzGwpV3Rq8MwuTKpHxKR6iKCkhWEYhErYKdFrJz
         oh55KPNp5QHUDdjbCdR9SgPcUxOyhQlRzxqyhhtkZMFF20xn9BZbJ8yjVpFjm/2gzc0K
         9MUw==
X-Gm-Message-State: APuU4Z+yqIeUTc0J9vMJZC+UPdjsXaEp6VsNPvVo8dtr5/fZafGByJTT
	CGk1+ZUbFOkIbwBMH9rE0SoVAUwp9jKI6gClA9/yf0zbdaC2cwTr885BjDs2PBBbZV6HKAfUnyr
	nZM2T9Yeh3CL8YuUYYRfF8ZbpTJwJBk4UZAmgKltG
X-Gm-Gg: AYBFou0oPe0HkaFLYJNyVZbaxK/7J5EEj3NssNCmisTadJlhXyKeRrW2s8uWJYWjqOp
	C4q/84uD42XCIYZy3PmcDdghjc3AQO/Q3eCBLLzIgpQ567Hw07bhjS34Gr/vrs205ammUTAc1LA
	nvF+tRucp6JYKATmlK61unCouIoHripj/yJNR4chUG8qD9SZnPbnhJDlurXC9C8n3IlidGjFl2q
	wlfsGbQOLCI4cKwiH50Obycmu8WVcodMc9LLB0OBQTPVnNmz7I/9TwXX74ctCsa9tpGEpekr8Cf
	MskgoGLvzpitqJPLSFqvvONxPUvmny3OBMgAhSNJfnaLoZ7UoJPObLJs4KMzvTE4h7uT7hWR+E9
	q4M+pxOV2Q3lLP1UFhjN4v8/hMCtcyY3OjuViXqh+BLhNGc4ziGjzA8K10wqj280e64xD+Fsdle
	dKJgKovaLAMhzTpJzClqBsFvMr
X-Received: by 2002:aa7:c2d5:0:b0:6b4:9221:8932 with SMTP id
 4fb4d7f45d1cf-6b6e7867b67mr4141a12.10.1793941942269; Thu, 05 Nov 2026
 21:12:22 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com>
 <20260930210750.1487547-19-chang.seok.bae@intel.com> <20260930214337.90CD51F0089A@smtp.kernel.org>
 <2b4779f4-c3d9-4b58-bc97-f31dba58fc7f@intel.com>
In-Reply-To: <2b4779f4-c3d9-4b58-bc97-f31dba58fc7f@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 21:12:09 -0800
X-Gm-Features: AclHuK_opVd9yhWh8shRW90UNd702LBlE68EsvOSF_68yFBs47J1mEWVZ_Maozw
Message-ID: <CALMp9eRJVdROXGE55qa3VGZBxaMPLoyMhZTwpkHPjA0nu9Xnvw@mail.gmail.com>
Subject: Re: [PATCH v8 18/20] KVM: x86: Expose APX sub-features to userspace
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:35=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.c=
om> wrote:
>
> On 9/30/2026 2:43 PM, sashiko-bot@kernel.org wrote:
> >
> >> @@ -1733,7 +1737,8 @@ static inline int __do_cpuid_func(struct kvm_cpu=
id_array *array, u32 function)
> >>      }
> >>      /* APX sub-features */
> >>      case 0x29:
> >> -            entry->eax =3D entry->ebx =3D entry->ecx =3D entry->edx =
=3D 0;
> >> +            if (!kvm_cpu_cap_has(X86_FEATURE_APX))
> >> +                    entry->eax =3D entry->ebx =3D entry->ecx =3D entr=
y->edx =3D 0;
> >>              break;
> >
> > [Severity: Medium]
> > Does this code leak unfiltered host CPUID capabilities for leaf 0x29 to=
 the
> > guest?
> >
> > If the host supports X86_FEATURE_APX, KVM fails to apply
> > cpuid_entry_override(entry, CPUID_29_0_EBX) or explicitly clear the
> > unvirtualized registers (eax, ecx, edx) for leaf 0x29 in __do_cpuid_fun=
c().
> >
> > This could bypass the capability mask initialized in
> > kvm_initialize_cpu_caps(), violating the KVM invariant that new
> > guest-visible features must default off and be explicitly enumerated.
> > This might break capability negotiation and live migration between host=
s
> > with varying hardware support.
> >
>
> Leaf 0x29 currently defines only one sub-feature bit, which comes when
> APXF presents. Additional filtering may be necessary when more feature
> bits are introduced and then filtering becomes more necessary in
> practice.

Sashiko is right. The whole point of masking CPUID leaves in KVM *now* is
so that an older kernel running on future hardware does not blindly
advertise new sub-leaves or new APX sub-features in EAX/EBX/ECX/EDX that
KVM does not yet know how to virtualize. Adding the filtering only after
future hardware defines more bits is too late for legacy kernels.

Why did you define CPUID_29_0_EBX and initialize it in
kvm_initialize_cpu_caps() if you didn't intend to use it?
