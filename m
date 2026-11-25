Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605067;
	b=jM3scox1EqzzwhH0OT9ID34VD/7gg7jknZylgp5DbLsnCytrM99/nzPWxPKCGOq3pkMF
	 wxV0wTdQ7PAvQT+sffLaDgyc/3ZgSOX6Y/pP638RKq4XQVgoGhkVKKdyF1dCDLbqR6wGq
	 11VmaRgJlORLJQCefeKcMXmmuBt8HYdnSHgmZs5snH67Z9fqg9OdAxXSvrPDbGxk/kYsy
	 n1DixDaN4dOX9lf3sKiRWoNLuV/hugdR+dJRW4jO4YYh9NqKmkSD0HolMM8hkg5gWSH0R
	 Nxe2yYZrPgCmWCj8saZVP/9EBnY/vZjHnk0tcN25yr3f8wZ9Lg6tJnxRvjXwgXJI9IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GwYSD6vLytxfk/SaYw157pRt5ax2r3pG88K3W/iLqQE=;
	b=mkTP6eTYuMWAE6/ijHJ3IeUhNgreag1Em6kM28C7c2Hp8MuHSGwBpta6hwXVoDW2XpL6
	 NYSkj4Q6vdlGuDVvCwQkelMJMUQj7hcYrfpz1itdZZdSHRdfiECQzh5P36uplCK22B06n
	 4AcSSALl35eMHPANiCR2FLzGQQ7oOKQ4SbXV/q3JhcGrss7r5lGI3QIzx+QpDT5Z/xtMJ
	 3hCpBiKYfVv4+pmJSo4L03qNgn1pa5lyfoDd7Kt77xZzKX34eJ2n/T2XXvBFWvO+NC+EG
	 mNL1M12zdTN2COa5pFSq+wu5q4yy55Xblr8NLCruPiN8TekBT7yK4haCxZaAs72qmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=MckuJdil;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383E5606A32E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 11:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383E5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=MckuJdil
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so55549645e9.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 03:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795605065; x=1796209865; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwYSD6vLytxfk/SaYw157pRt5ax2r3pG88K3W/iLqQE=;
        b=MckuJdilZGl7PwzDuWSuGXt0stTgiCaUNhvpEr/C7Ps7DUB9KnAtvngWYmAbTXKNJB
         n+mhqgK9fc9nvLU/O6Zig4lhUX4OwAIOOo9/sJPnc/WHAHtOkvjcR9M6mYobGenmZ1/K
         8gG6/SRNfIXo5halpvtnluo3VPtGJsJJ7PjAhLdyOtYYUEC+Fn0c2xNVZ/kvrE+SYliA
         SBGvZTyNofpaJQvO6rQq934OPGh0gQ5Noha2H0TeilvPeeK0XmdU7yUT86JspIkv6KKe
         6puSR2o4XG57s4Y/fm2i8mu1L4jZ6xMRw4cJwnqxZ7qFvQakE7oeFUnHipr/cwlgBrnL
         pHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605065; x=1796209865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwYSD6vLytxfk/SaYw157pRt5ax2r3pG88K3W/iLqQE=;
        b=gBIMuRiDzhafa1TwoX64CVKr4zN7DH0du33jxMh5PCUn7sLRCulA9oUA6yYQvmlhj8
         +w3UIWS/+wwAgG+DhQriReKt1kHsLFWi6gE8mfFs+TNuDIMbkGRubK1ZN0EKIj8CfAs5
         trMHcaNyBkkRT9ZHStM6D+jTtcgk7fgI8Bi36eNzoumnai17tBYt4OfLco5Y6xxiWuvX
         LNtCwA4hL5/uVnjwPt1Trb0fWxT/BrnvMLrqWP2FaCdyYrtPu5Tw6VbERugfEgx52koC
         cDqxUuYbuNh6Lghv7MdwFtn4gLIWO+4kCwyXIk9TCQFoVRT9EL/vZAEDKkksDM5znEwb
         gHTQ==
X-Gm-Message-State: APuU4Z9Ih4Wk2t4PFkoG0P8038u1VCAR6yhPd95/JlowpTnPxCREwzwg
	j9ldUIcfc+nN93bet+Xlw6lxoPvM2Dze7FsGuGuC6mBk92FdlfJXPUp+XCAW0dZ6KxFJJf2kq5j
	JEeYjmHE=
X-Gm-Gg: AZFdTZedQWDg5PmTGfYBMivc5yAd5xBKiVBBmzLHsoDeqHew3m3aGb8UtgK5O+Wq+Ul
	Kg1EaYv2o0gRz3Blazo1xWfnuyg6xuzfF2u0t2WBGZOsp6WAEIA6jphMT1azDSkkaBWxHMtegkb
	PsaRcKNw/qSfGp6k9ymmPJa514AMD+Dy45ZzMkv0Fz25cwHyjQF4IQoVXVMmjssgHRanxAnBqY2
	5DJ0lJMZxYcrdHd8si656nzMSkWm3yBPLxFRGZiLuW+/XMoUpAzPXpy2oqvRO3fYNclp3QJ3Ivi
	8uDJV8hQ3YvSofR2Sh3cz7phX+ofBSEd740IOXpsmNZwUtOHU3Wl4tkGC5UHA6P/W+AXNDjMCXs
	AYaZS+HmdKg+foAGO/iyAtlbWK91e391vILF4XTEMdl/2zwIszoNqDKuiECQq9FUPvxpVXQhQsf
	rZrtNvEo1u5YAdkZvcIj+Lo4V3JV6KhVH9HqowdCsKKBTMgkPb2naO94utP6Ex0rX7HDNeGRKce
	5BWiNmRPYIIyvqJZ/1D55lrP91ymqKnYbVyRSZJ1v72byiYw6pCTu4iS1mwUR1d0jY8yCCgrQuf
	ZVn+g2+kgEcJ6cPaxQ8=
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr402949245e9.13.1795605065419;
        Wed, 25 Nov 2026 03:11:05 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm33509812f8f.52.2026.11.25.03.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:11:04 -0800 (PST)
Date: Wed, 25 Nov 2026 14:11:01 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Oliver Upton <oupton@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 6/8] KVM: arm64: nv: Don't deliver a pending SError to
 the wrong guest
Message-ID: <awbCRenrEfnRszC_@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-6-224689d8a764@pereq.eu>
 <sashiko-outbox-232776@kernel.org>
 <awaWhy3IywYrP2JZ@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awaWhy3IywYrP2JZ@kernel.org>

On Wed, Nov 25, 2026 at 12:04:23AM -0800, Oliver Upton wrote:
> > 
> > [Severity: High]
> > Can stashing NESTED_SERROR_PENDING here cause sleeping in atomic context
> > on the next guest entry when a virtual PMU counter is active?
> > 
> > When L1 has a masked pending SError in HCR_EL2_VSE with HCR_EL2.AMO set
> > and executes ERET into L2, setting NESTED_SERROR_PENDING causes the next
> > iteration of kvm_arch_vcpu_ioctl_run() to re-inject the SError back to
> > vEL2 while preemption is disabled:
> > 
> >   kvm_arch_vcpu_ioctl_run()
> >     preempt_disable()
> >     kvm_nested_flush_hwstate()
> >       kvm_inject_serror_esr()
> >         kvm_inject_nested_serror()
> >           kvm_inject_nested()
> >             preempt_disable()
> >             ...
> >             preempt_enable()
> >             kvm_pmu_nested_transition()
> >               kvm_pmu_create_perf_event()
> 
> The PMU crap should probably go in a vCPU request to avoid this.

Claude is happy to write a commit to do that...  I can add that to
v3.

regards,
dan carpenter

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0614c3b3a40d..6a22156c9107 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -62,6 +62,7 @@
 #define KVM_REQ_MAP_L1_VNCR_EL2		KVM_ARCH_REQ(10)
 #define KVM_REQ_VGIC_PROCESS_UPDATE	KVM_ARCH_REQ(11)
 #define KVM_REQ_RELOAD_GICv5		KVM_ARCH_REQ(12)
+#define KVM_REQ_NESTED_PMU_TRANSITION	KVM_ARCH_REQ(13)
 
 /* Bit indices for kvm_arch::flags */
 enum {
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a148e80d0aef..fe5e4e47b935 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1310,6 +1310,9 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
 			return 0;
 
 		check_nested_vcpu_requests(vcpu);
+
+		if (kvm_check_request(KVM_REQ_NESTED_PMU_TRANSITION, vcpu))
+			kvm_pmu_nested_transition(vcpu);
 	}
 
 	return 1;
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 39136a89d74b..ee71dfc4b861 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2837,7 +2837,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 	preempt_enable();
 
 	if (kvm_vcpu_has_pmu(vcpu))
-		kvm_pmu_nested_transition(vcpu);
+		kvm_make_request(KVM_REQ_NESTED_PMU_TRANSITION, vcpu);
 }
 
 static void kvm_inject_el2_exception(struct kvm_vcpu *vcpu, u64 esr_el2,
@@ -2929,7 +2929,7 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	preempt_enable();
 
 	if (kvm_vcpu_has_pmu(vcpu))
-		kvm_pmu_nested_transition(vcpu);
+		kvm_make_request(KVM_REQ_NESTED_PMU_TRANSITION, vcpu);
 
 	return 1;
 }

