Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D543455292B
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790086850; cv=pass; b=MeQCQI/FBn6nYS3p/LCVMcbaslxF+1OCkG5El0x6p6GvH9vJRoLLlQVgje2S/9xeNrSlEe0Lf7BNgnXZ0nbfEsVrvHbXsALe9Ac9JmmyXeAD7s8OngSpekQS/g7j4WbqHVm2/cyFnjA7n2dQ261XZ9RHiei4sC8aVgmY132ePLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790086850; c=relaxed/simple;
	bh=HxcTZBxIHlFg8VjYKTjraINQ4dfq1xbF20OsB84LKI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBq57z/20MI5B8qlqsgy2l6csJ4n6ptVM4GalQQprqplvkao4FS5INEuXXJq7KdkCbCcuhr4Wt0X7UZqjvAXXG0omFFFY6PDjAPq9e8LeSXWZUuXCIPPctHuFv4x1l6Qk5wP9mQUvuE97UGLO9FuvDSeVEJiUQGwFUfUM6n6PMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=viJnjSSP; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="viJnjSSP"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-532e9ad9a1eso13471cf.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 07:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790086844; cv=none;
        d=google.com; s=arc-20260327;
        b=IMrZsp0fSs6G7NZ0XYyrVd2/u5Bw87VeYWLEdkyCmG0wLpfBGgbXaU1l5/vu180Amv
         oUpESCJECOqL/AUUtIY6CDfzptieyRE/WscfA7zTxAIKTr6784DCFSG/y884FhSDtoXx
         UDNhTxFScrqGNT6SiO7bFXP6q8xDsbUvBFRulDcm3raYr7+wGaJIkQBoAOjxFtN5kBoQ
         9k7mcKeoTdWfxN6gMPlRHbYIUoK9Bx4M4eNhcAHBji5+8+wU2ZzK4dzBVhSv9h1TS29l
         30RbxvhVzm2SYRNdeJHw6aUDMMpbGYuh/WyqsiYyFVe47CRo1tskkT4cVwr9hKJCVHH9
         0OCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7rTxuINz/tlh04A8Ubhtgy8qNqbLXxKs+YLLNkF7A1Q=;
        fh=9lL0hF0NMGethsOlsxoDeLBT8jtu7UHbhiekQ8TuZEc=;
        b=K/iJtMfIDQHhkdoI2B0qinYFVsr7deLOkU3wIsd5AOZU6Q1bvvmjRjwUbsZ+Sg3829
         HdMfHP3cOsbFI2w24RP4hxfomiprYukgIuiwhnQKg6WeWhUn69RBzYVlLx4UWfWV6fAD
         0lrgxP5LSGgn2fLGK0aVI2bR4YvSXps2UObdeEWUE56797uFdP6eL1oSo4EtEigLvlNw
         56fUW5OUnBj8NZO0qSUFdh6OHKyQxUkrcqvzoebg+ebhqhwGJqFjbXZE8cJwoo1qjP7N
         VuJkFHS9P7XnvYq8i8SIRIZTCGdqh5G9eMRpgl+WMJilVMqglSGLq4k2CnufROwMg1k4
         XxBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790086844; x=1790691644; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7rTxuINz/tlh04A8Ubhtgy8qNqbLXxKs+YLLNkF7A1Q=;
        b=viJnjSSPMEOLMn+nmnTQuy/n3rFMRkj5AJao4CpaVXvn7/H0xnCdWill5XNLhOJxjW
         8xvXvVQsMBbyh4AKQutZ5bTqZcdRsAQtzUs5Qi85XIofBRfEwllt/qoVNUXTIHWDw/4u
         u33QZUkw5qYhgozsEGKyIwGsPzAa23FS2rR4t6oTFdenZfod34SA0i5jkDYAINFzkfXY
         3sNchwnubFHnxM1AYkOyLQtfcaFduJomYgR+dKkwQu2IfCoL6/C056RNgKVRaJ6bbPFN
         UHtrCCFY8d3Hfyd0CMQRces7rAd4yTZiwmI4RQHitI0Nc03uvF+ym1SaAw0vLAWXC4Z2
         NpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790086844; x=1790691644;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rTxuINz/tlh04A8Ubhtgy8qNqbLXxKs+YLLNkF7A1Q=;
        b=tLiDIX46Hrr8FCWbN/iaHNYgE620GA+h+JEJK5cRrfFs+tetj29JkxhYFZnD8UL49x
         /A3guwn8LydrGGV0sMN30PRRgacxOKT4o1CFHTG4fbwFgGLmxhjoDinHqF5E60wbj9n6
         aoDpFycegrt+iu33uAMo1iYYXVSXmmJEGMLitkjef6LkxofEQ5qlOny38//tV0WUBBpy
         MNyYS4JxH/Ta0aELOtrELB5gIUvfONBi20FAFfWPpu9a9cfYW+GkNkFJrHU0M4ZKbf7T
         wSO6Yd2IV9Hf8P/nOWsbqUSvksDTvK1PfxMg9nY0g/M7gIfLqX0eV/hm1FCmLbUbePDM
         lNyQ==
X-Gm-Message-State: AFuF++lxUX5JmcYa0TfOuhztzFWdC2wMXNiysjoGDN2RESGXM+9USA+V
	M70iVHrxE1DfVVQRF1dnfceX7E+ToIkDJftpJUyXl8GXGH+b8hxosmtjKNkpou3WzX1rOOBVvED
	Im4vRSpWfIr0BywtbRbf8I5wbX8kSpsUWXKlzq5wX
X-Gm-Gg: AYBFou2sCxDQQ+A0HG7c1rW0kfMU31yZ4DJIRPnx88HhSKJ68Ed0zGrM0R/5PqQTc8D
	pjjL3fQnxGpCX56tUMElAiEz5AKEBUMriYIwnkq90BEfT1aVlQmwi690CTOdQf6F99bCh6v5Dra
	ExTLPJkp99XB9wTMAFdalJLG63yQJpmD7hQcmhh6q3NssKZ+bGHqbU0PuSy3Z7QYqvLUJoOBQ92
	ZosQ8LU8lvBSvJP8ErrnEbSNbO3+GiMK/HIYf1yfuwux4hgoTDurfC7Zf1EHcYFdI0uQH6PcpAw
	JWihiRaENZcu1LDnUR2UZZ+BLWm1IwoRwcNpJQpokgIQEghaZX3SVSM=
X-Received: by 2002:a05:622a:a16:b0:531:16a:5a3d with SMTP id
 d75a77b69052e-532e864756fmr2029421cf.12.1790086842237; Tue, 22 Sep 2026
 07:20:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918154530.4129698-1-jmattson@google.com> <20260918160109.E76B81F000FF@smtp.kernel.org>
 <arKJQwAPvApkeESD@google.com>
In-Reply-To: <arKJQwAPvApkeESD@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 22 Sep 2026 07:20:28 -0700
X-Gm-Features: AcwNN1UNSpjbx9ZFSib4LbupARY2BAqtFx868cZm8um8dHez9pT9JspsNfZWaLQ
Message-ID: <CALMp9eQboC6DTQfa3N58XCfOLf-qwJ2L7dC5vtqDerHG80eZLg@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86: Disallow EFER.LMSLE when EferLmsleUnsupported
 is set in guest CPUID
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:57=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
> Gah, I hate the negative "feature" bits, I've gotten completely turned ar=
ound
> multiple times trying to sort through this.

Me too!

> IIUC, you're trying to "fix" setups where host CPUID.EFER_LMSLE_MBZ=3D0, =
but userspace
> configured guest CPUID.EFER_LMSLE_MBZ=3D1?  If so, then Sashiko is right,=
 it needs to
> be declared with EMULATED_F().  I would even argue that technically this =
isn't a KVM
> bug, because KVM won't advertise EFER_LMSLE_MBZ in KVM_GET_SUPPORTED_CPUI=
D on such
> hosts.

I'm trying to make it possible to run a Rome vCPU on Milan or later.

SInce this is a negative feature bit, it must be retained if the host
reports it. That blocks running a Rome vCPU on Milan or later.
However, a defeatured Rome (which reports LMSLE_MBZ as 1) can be run
on Milan and later.

It's the same feature-hiding we do all of the time=E2=80=94just inverted.
