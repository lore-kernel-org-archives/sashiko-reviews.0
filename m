Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9344606C
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785518881; cv=none; b=E+9Qv5976ep7TQytBLhmI2M481cMO4Oj4nAxdgkLHKitj+sYKlrRWbk+wkVKQLsx2B072914I5ErtkqLDQSzVebl5C//uWx0k8mLjnnf7iiGT2vuijX0HgnGA6lXl5SXG0xWdX3+pB4SFKlBR7XbFDwrXiCia+TiD2PTQc41des=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785518881; c=relaxed/simple;
	bh=UDpYe2Tx4XuD5LemyWw//zY5kwL1leOW5OSpqdrWcSQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RF29IhLPkH4sMZgiz0u5oJ7AhblGnlxO+oCnprmiKg5i1xef12fTRGbEsGA/BRhn03J/7UIpXGZYX30Bm1IQTx81Q75JWG5ZpCEBUQ5AYd4CwsITE3BMMyTc9f36xrjr/NMsp8im1ylNhonVjGRg/WWdN0j08jp5RHjdqKduZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p6ljfea8; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p6ljfea8"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso2121275a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 10:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785518880; x=1786123680; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jIfuZJWx97IVmiAcI0nYTV5I0RoblwpbhFeaam0U4M4=;
        b=p6ljfea84inPxySB8guac3Bmqgpuwhn9gUPWqZwwXRt+oJJV4yLcGIWKB3ylcb3Rb4
         6JYbW7RIgWsDMYQZS31BiJclHXOF/fSX8AE6gvNAG+em3QyamAsPTXYc4bgHqJT6tqSR
         vr4AqHnqd23lRwrR7bWTuBtkiPJkq1fqImYHj0olRVrUcjlZZstJxY0t7A6kSYKzrCKS
         Pqo4zaVhkYOGfoeq++Emtr5A1BYQJytj5SVYcYHqI4MGd/8BwwjNT3Xt77Mm+igBXiar
         hpeI9dRTszc7qcqRi8Fz3cbrlZ7e2XmrSIKbslpg8i8+qKa+CXbSrWxUBRXSKS5U1r1L
         4WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785518880; x=1786123680;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIfuZJWx97IVmiAcI0nYTV5I0RoblwpbhFeaam0U4M4=;
        b=UviFvUiT7nzHLoBsEK8YQgGOWAjrQbpx8rBja0HBtrJb2LFt9n1SqHgmmTrj9zoCq/
         DpjExlEjC2FSQLs7FVHoVmyPbngkH7d+KAdsy0kmR7K6qgzoOiWssLB8beioHOS+fabQ
         oJHVBKLZfA67Mp2uSHc88BJmlGdMu68ahQq7fdGqdQ1NEKezYx4Jv2RjavTigG9LPdSJ
         3nixKFeulaxlwE/kJ2V4Dq2yZ+brR8xHdMnHfPosbaGPO8rmtBTECI1z9jMSHqn3+dC0
         sr9TtuOQQvwk20YtPgn1FG3hDizlHjKyuQQxkz1cRHTtQ/tUriC3lyFZ99TsTKHTi5bV
         8YhA==
X-Gm-Message-State: AOJu0YxE6fSHNgBLDjxtcaqEpyb3Vyx25RP/qWyagyD0SPrQonpL6Vxz
	XugatdSaZONj9D5Sybd66B3Cp5T/rfELW6DNSMzjKr4vL5AsXUYE/zHB4NfQ+L67NkV3b//w8a8
	KgITwyULb8lTWCuev7zfcJutaOjGESU4bst+z6fhTvFT87kXQj3ixlgVyX85nQWGFNLmkU/P7s2
	lZ7laiGV2BcKqRER2lIsCyB+1PGWxh1RUWiIoLzuQyPAws7XuA
X-Received: from pgbq32.prod.google.com ([2002:a63:5c20:0:b0:cbb:c1a9:51f8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:50a:b0:3c3:75ff:95b6
 with SMTP id adf61e73a8af0-3c92a748fd1mr582286637.31.1785518879545; Fri, 31
 Jul 2026 10:27:59 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:27:58 -0700
In-Reply-To: <20260731171540.7B3FF1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260731170619.2620845-1-seanjc@google.com> <20260731170619.2620845-7-seanjc@google.com>
 <20260731171540.7B3FF1F00AC4@smtp.kernel.org>
Message-ID: <amzbHqvWFk5-HpQY@google.com>
Subject: Re: [PATCH v2 06/12] KVM: selftests: Affine threads to random CPUs in
 hardware disable test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 31, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Randomly selected CPUs are not removed from `allowed_cpu_set`, leading to duplicate selections and artificially reduced test concurrency.
> --
> 
> --- Patch [6]: [PATCH v2 06/12] KVM: selftests: Affine threads to random CPUs in hardware disable test ---
> commit 093b65b96e15e7cdd5b611bd7d8556fb88cae6e6
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: selftests: Affine threads to random CPUs in hardware disable test
> 
> This patch modifies the hardware disable test to affine worker threads
> to random CPUs instead of hardcoding them to CPUs 0-3. It also honors
> the starting CPU set during this process.
> 
> > diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tools/testing/selftests/kvm/hardware_disable_test.c
> > index d8288147b0a69..bd23c13003707 100644
> > --- a/tools/testing/selftests/kvm/hardware_disable_test.c
> > +++ b/tools/testing/selftests/kvm/hardware_disable_test.c
> > @@ -149,12 +149,15 @@ void wait_for_child_setup(pid_t pid)
> >  
> >  int main(int argc, char **argv)
> >  {
> > +	cpu_set_t allowed_cpu_set;
> >  	u32 i;
> >  	int s, r;
> >  	pid_t pid;
> >  
> > -	for (i = 0; i < VCPU_NUM; i++)
> > -		CPU_SET(i, &threads_cpu_set);
> > +	kvm_sched_getaffinity(0, sizeof(cpu_set_t), &allowed_cpu_set);
> > +
> > +	for (i = 0; i < VCPU_NUM && CPU_COUNT(&allowed_cpu_set); i++)
> > +		CPU_SET(kvm_pick_random_cpu(&allowed_cpu_set), &threads_cpu_set);
> 
> [Severity: Medium]
> Since kvm_pick_random_cpu() doesn't clear the selected CPU from
> allowed_cpu_set, can the same CPU be selected multiple times here?

/facepalm

Remembered to CPU_CLR() the selected cpu in all my fancy version, then forgot to
do so for the simple version.
