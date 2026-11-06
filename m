Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793942581;
	b=eNXUqdhdvEExTlEc0oQvHxEC6z2SlXDxoeWzym+4KVlMrD+xzJ5BmZgVw+XE1AYmSWDc
	 2GlU29rDrUWPgMOnEkVTSb4pnD+xs/QThM70g6HLWSeuKvnhSJGweug4dRTz+Kj+e6yjh
	 A1sP5e+Fsaoy2JxmCFf5BqADksGb7ilrqeybCNQpltV7V2+W3fkjDYVWY5MObTPL6RSw4
	 Eso3DS73f1tuwYquyxM1NG4j2EvBPbLDCyAqdmP3eCSbP/PEi0YuE5YJfPwQWNW5aoX4o
	 Mi6ShXJ1aPGqh8ejQCEgxxpfkh/8Ytyy/ALi77qx31DWe1Swdjyq9uuN6YpyYOR1JPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Lr3lGEbBwXSP6n4uutvUzv2qEuwZ5jDJob60Za7bOmw=;
	b=ypdNumkBpyy3VmCYD+r308LNhE8pjZYe59DN5jdq7IrcprvZAXlY7A924PsndXr6xHwe
	 yZQG+rmLhAic+oRmWgymHJTmq5MneHt9TDsrMAztyhmmNafM6eKmwPxT/c0PmAT0gWMIo
	 Ep1n7goWw9e8nK1q0cGdG3ceek/CEA05PnFHrXjBlYOeIOkowfa+oDXKBxpjI9Gxeh4+n
	 5b6Z1uOfy6iuK+vKWLzrz6fFQXjdk/i9NBj3OFPvfXra3vsuIUKiXDWMHsoRdGpsfODNB
	 aMN6v0C8xrCjnEHAq67GNvmW93H2R/vWrn4R5E7GjFgjDhcWKJFVPwXK0Gmd3J+UZ8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nJdAyTKx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF3A606A328
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 05:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DF3A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nJdAyTKx
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so964a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 21:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793942579; cv=none;
        d=google.com; s=arc-20260327;
        b=sfQCVD8tj7C6qE/LK2YgwbTTiVegIj+gqIDzyYU55IPw3hTfsiFaliZwXzzzxxPS0S
         i78ELMvAOnZtSO7e/E2F7WWGj6ksVhrniatKmNdS4VtwBtyirTp4FTc5I3BNbdPIuox+
         y5Rw9lIEbi9WI6BHc2TlUNtujYIoQVdS8if6dQZVQ6IAxSSqEDVpPKEMs4htk6/sWEae
         ZcRnFpC/1sbGCo+2VkUt3QJeFQ7cJkrWNq6WIxt/pMc7Q3LjUKDFLJ6w+fiH9CHFk8x2
         fcKY/qinrdDPu4qCYy8Ica2qu8D8299KRKAUbuAaY6FgIgwST1n7RzJVwrauzAElzv8Y
         A04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lr3lGEbBwXSP6n4uutvUzv2qEuwZ5jDJob60Za7bOmw=;
        fh=nlkyPUp2r2LWvw5k35dW+ysIlz9psoez4cokmdqutLw=;
        b=Bo+WgUUWFLeOMVOm7bUANDXdrBgFNQqC/Sj1hFu0DAXm49b2sJ1E1NisP5ei1ZmKrZ
         WZ0onVTBzPOELdlXZO+syTXQvSYtNO5mdDbx4qmhupyizTWUQRpRqLQs2n5tbW4vPtcU
         /qnc9NLYJljjWq/pfwtIvI0Q59GPnO+M3aKf1G6M9VLChIwFYUCDR1oI09oqrSz1OfE3
         IfvUcCxxf991+BjINyiwm8DDF8viIRUEqtGytyiXMgLlmjMGCqaNC42L1eQpVU+zP3dY
         t31gbbkA33qyLB5XAPidovjCL2AGm4+pM80HN85DZtFMh1/F/czAIF55AXqi8496cHR+
         GFVA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793942579; x=1794547379; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lr3lGEbBwXSP6n4uutvUzv2qEuwZ5jDJob60Za7bOmw=;
        b=nJdAyTKxyOEHxW+27BkpyoPyd3Zgr2sdIIdb+pNfb4+K9InNFW8EzhnY3M0Z8APkHw
         3+9/F5tZIizBE07yEKCbLJGeTrjZiX8t1p1IcKMkyof63wnuqJIz6V95vOxDSyV1jhM2
         p0vd1RlU/X4j615OouJKugN7DjacLJ5iUEMHeh/5k812tRyXw/Hgibb8qnT380SMZ5Rd
         IJT90igkuEl/hehlaxgWaYIrh7360sv917PggHb2DM38NnN6k9+/fmRRBPgMPeIawnta
         EY6C2q8IrQM9/VYcxCTgbCZ9DRG7eVmMhp64GWWejHUnjWKFUSh6QBQwvLfepyf1ch87
         AIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942579; x=1794547379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lr3lGEbBwXSP6n4uutvUzv2qEuwZ5jDJob60Za7bOmw=;
        b=Mw40fWO5B/rv2FCrM5vBam/xCLF73j27YWHbG6JjeZ3vkfhko9oUEICwKrlWOs9z/V
         Q+RI4aPBOUsjY3lZmstG9xP3sCHmIMNC/CkqAywK1LbBriKF5bVBjq91KIppf+VXf/hZ
         fNIUGF9p6i2HjbcevbS/p3lGIVljJpUlPa1F563d2V4koHYFTvD+avEsAT6AoXimLEK7
         QjPG2nCKYE1sw37V9okA0gMpExPh0lxcip7h193g+clh/PPWkjMJAOeLk052hFSwhkhT
         9y84IWYesoBwoYFNMXwouP7SDqW63fA+7AfSlWZ9/yfpOScBFCl3L5r/oJ6iKjBfGwgF
         iK4w==
X-Gm-Message-State: APuU4Z/CSEMJn1yJfzTwgYZJDJY9anFA1HPdv6hcWKZ8Ibba9Bw9MIZa
	FfeM+Mx2NmyhHNUELRDXz1amGquXAziNRCvA/Ko2x8IibLBw6GJ2iEGqEepvmtOImx6NsPU00zj
	Hy+FknkjvRcPvSiHQZUvh5eTtpAzpPWutKHJQNOz9
X-Gm-Gg: AYBFou1HfYtFUNlrNl0MUyIwrkIgsiA8teEEEHNIC77eIDGM1tk9aM3tH5q2XTcWnwe
	R7U8t7omSUYWPIwFsEL7BBvWBZ1vhKPFRxp9m9Qq5XeKsF5lOFcIzdEGLwECR7UEjpq2LXGLbWY
	2cKuBisY+hYp5jzhdvZp9uucJOLl5ms4ud44X9cuo4NYJhz9UJsvnxqfZPX5AQ7hUoQ5doEGcIK
	r2b9TAaPWoLX73920RgsSf4JBQytcu/IZRx/Xp8nX8sL2Sj1hDyphvPLOOu1SuZ2J0GgqJgYczJ
	PJfLrAirL7RU1+aBRsuS/XJy+Xz5DaUSl7fsBbBds7NiiXSua+bX9FYnTQst6lH+3MEI0gvpg+N
	5bWnuA77rDA7iXYx7ayXnbrHtNZrYd+i6HWPEHwoo1GbEFxrJHZ/DE6XnEDmI6XxcwrqNPzAm07
	vIUjl12Ya2516Bmar8PTwQGKNZoodYAiU+VEn/Ix13yyg7uA==
X-Received: by 2002:a05:6402:54b:b0:6af:97c0:ce51 with SMTP id
 4fb4d7f45d1cf-6b6e76192a9mr2321a12.13.1793942578969; Thu, 05 Nov 2026
 21:22:58 -0800 (PST)
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
 <20260930210750.1487547-20-chang.seok.bae@intel.com> <20260930214824.158FB1F00898@smtp.kernel.org>
 <f56b02c9-0954-4d53-9e51-f9b7cfc5baf4@intel.com>
In-Reply-To: <f56b02c9-0954-4d53-9e51-f9b7cfc5baf4@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 21:22:45 -0800
X-Gm-Features: AclHuK8GnBbvokQKB0pCMrxKYOwTMrjXF2igv3lvpmfxhvOjlAOs2IZM4IKwEVw
Message-ID: <CALMp9eQqbj0is11H9vN_a7hGh4R_PVuzdXu4KX9Z3ZJNcGk_=Q@mail.gmail.com>
Subject: Re: [PATCH v8 19/20] KVM: x86: selftests: Add APX state and ABI test
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:34=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.c=
om> wrote:
>
> On 9/30/2026 2:48 PM, sashiko-bot@kernel.org wrote:
> >
> >> +static inline unsigned long read_egpr(int reg)
> >> +{
> >> +    unsigned long data =3D 0;
> >> +
> >> +    /* mov %r16..%r31, %rax */
> >> +    switch (reg) {
> >> +    case 16:
> >> +            asm(".byte 0xd5, 0x48, 0x89, 0xc0" : "=3Da"(data));
> >
> > [Severity: Medium]
> > Does read_egpr() need the volatile qualifier on its inline assembly
> > statements?
> >
> > Since the asm statements only have an output operand, standard compiler
> > optimizations can treat them as pure computations. When called multiple
> > times, the compiler might cache the result of the first read and skip
> > subsequent executions, leading to stale register reads.
>
> Without the EGPR option, the compiler shouldn't include EGPRs in the
> optimization options. These tests are built without it.

Sashiko is right. All the compiler sees is a non-volatile asm statement
with an output operand ("=3Da"(data)) and no input operands. Per the
GCC/Clang extended asm rules, an asm statement without volatile and without
inputs is a *pure* computation that always produces the same output.

When test_guest_update(), test_userspace_update(), and test_guest_apxoff()
are inlined into guest_code(), the compiler is free to CSE or hoist the asm
statements in read_egpr() across GUEST_SYNC() and reuse the result of the
first read--without knowing anything about EGPRs.

Please add volatile to the asm statements in read_egpr() (and write_egpr()
for clarity--even though an asm statement with no outputs is implicitly
volatile).
