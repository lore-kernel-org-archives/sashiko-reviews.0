Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194880;
	b=SpGD4HGBFS/jI7cfEqEGb3MsnuycitrJo7sPd8Vv1TwMFGCFu4bJ1ms6ieHwI+S6o4Wc
	 MfLzQpvp50iJuMuG2R4Yd+q91nO0vQMQoBGuvSQHZ8oTbHYQdrO4PWN774Oo0HSFeGn3T
	 z+h/MlXvu8inPizfslQyBZhBhRzmS9g3+ogo0cuGjfg1cdq0Oor4lArjmzyHudiArIzmd
	 eGswV3LoMbqbAOziWL6UUOkvRPN+lLQXO0SuYPlNEjcjXHOM342EAqRcInzu86hwgZ++E
	 GbKSFhAuS6EEdpDtZ0DSnlWCsjFumEFzsM2cUOSTi3J1/j7KfZlmaSSryHUobawqihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PF7hA8qtLtGMgmmqrzl6s1EtCDWETZWVgUxkDpAKR/s=;
	b=JR79j3v56EV61zevWRiLunwaMD6qr0eR95u8xD4kvXzUhjFh/4rSLjxJcrFutWGoW4+b
	 7nnjSGe4wW1MGXq5gaNw7txe6VFTOClRYGiW2hmH3NI+A1hu4FIVe/ajXyJNcp3QqY/UR
	 vaHxgsEjsnmTlsAU4e4LgprfwYMPo9CLuomFnp6xiLa6poReNXJ1XKBbUaIpYFb1o93OZ
	 CQ0rw6AOqNo45UAiusJZkPbHGtFbSMNopOrO63QzneoCRN9S3Pja6vcjfQ14QZO12SNXv
	 764jDuGNbH/AzmE6Z1g4N2cTWsYfWLKOP1OaPGATm+1v7FuzydR3vG1pkJyYPHz4Dnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VrJfqxNk;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D73E606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 13:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D73E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VrJfqxNk
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so1356484a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793194879; x=1793799679; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PF7hA8qtLtGMgmmqrzl6s1EtCDWETZWVgUxkDpAKR/s=;
        b=VrJfqxNkEQ8LVCOtbIwIfpIx6+Lpi/B9sYbxlXp5WuHtAgJAV/OcOoqSP0HzbA/kdv
         wAsUOPPcID0z14Lp3o9JQqr0zsMomV0zERLJF5JMoi6TxEW3yXJtO1UFxtifej2oPqiG
         krFewcvX16R3/UdH5Y4WGCDnNlJ+arWwVgLELjoLkYKEMjFF0iBJYHguCxW+QP9IWD+k
         e79NnEUXb0obNZXAoNGpWAmrdGGG3dc0xqN/iBW5zmqAPBMid9BUOP+jTpqBvxYxylMj
         X0OwNxRHXh0sHr777UOcIGwpumualdxcyxhUjWWgARJwPaT1M0YV9hnOvSyXgyPlUrZR
         nz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194879; x=1793799679;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PF7hA8qtLtGMgmmqrzl6s1EtCDWETZWVgUxkDpAKR/s=;
        b=v6AYmD9iUwxDCyvpSxkqjySLnJAvt/SVETqoNSzBBH+s9flVzB0OwgDNKzuD9r8PeQ
         Y7koft+nTiVLBwFj4nMDpOLqLXvSVmsJ6Dl5XcAHR1ftVC6hKhfj98274VdJiPb633o7
         +W7KJA9lYhOpsufGSsW81GwTBuiTsktuPXFSNYXuZ8yaBUOs8KxTvTkXsYRAyZJxTfvn
         JnQq0tG+11ZMcEQNTYSnsw01/7ffTrm2iFLqYMP8lh0Xl33GDjXJOnzhz6P70pH0fRJ6
         scpTEzf720A6aIE0tkfrABm1LxPZOxUHxTCvAFnVkMYXEIAO2t+u5Iq+h8ltRia3BsQX
         J9dg==
X-Gm-Message-State: AFq9FYL8u8M1Sy94uWq32jcuzDaTdSPU+okeD3MxvLHg+gaZPT6UDlUF
	sYPPgHYUblpTj1Jn3izcvYoic4tywNa5vq2tA9camSJUKN+K5Mf9i6Xs0dS+cHCFEEXt3EXEsDX
	wqEe2SNKDGJjbNw8WtlLWo9efZcYqRFxXoiR4YpRtJdVnl74gBx+Z4pP957do+6IKaaJUJw5vk/
	3Qxg1iIUXO+G+xtMJ7hA8FTGsJhwnAyUAKW55rJ4t+VCYTXeJj
X-Received: from pjuj4.prod.google.com ([2002:a17:90a:d004:b0:3ae:913:ee08])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d00f:b0:3a4:f75d:d194
 with SMTP id 98e67ed59e1d1-3ae58228c44mr1916090a91.36.1793194878690; Wed, 28
 Oct 2026 06:41:18 -0700 (PDT)
Date: Wed, 28 Oct 2026 06:41:17 -0700
In-Reply-To: <sashiko-outbox-187178@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027224914.1574319-1-seanjc@google.com> <20261027224914.1574319-7-seanjc@google.com>
 <sashiko-outbox-187178@kernel.org>
Message-ID: <auH7fUGZnfGvg6lQ@google.com>
Subject: Re: [PATCH v2 6/6] KVM: selftests: Expect failure when trying to set
 EFER that violates vCPU model
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 27, 2026, sashiko-bot@kernel.org wrote:
> > @@ -222,11 +219,6 @@ static void test_sregs_lmsle(void)
> >  	vm = vm_create_with_one_vcpu(&vcpu, NULL);
> >  	vcpu_set_cpuid_feature(vcpu, X86_FEATURE_EFER_LMSLE_MBZ);
> >  
> > -	/*
> > -	 * Unlike KVM_SET_MSRS, KVM_SET_SREGS runs the full set of guest CPUID
> > -	 * checks, i.e. rejects EFER.LMSLE even though it's host-initiated.
> > -	 */
> > -	vcpu_sregs_get(vcpu, &sregs);
> >  	TEST_ASSERT(!(sregs.efer & EFER_LMSLE), "EFER.LMSLE unexpectedly set");
> 
> [Severity: Medium]
> Was removing vcpu_sregs_get(vcpu, &sregs) in test_sregs_lmsle() unintentional?

No, I intended to delete just the comment, and unfortunately the test managed to
pass on multiple systems (I'm guessing my build zeroed the stack?).
