Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA50B3F8251
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745610; cv=none; b=GoLaz1vllLD0hnL0F/ZhQl+VXajJDR0jZnQImibAXq8vyfc4okG75+cQMnBAY0Gk7JMoQifqCvgg0uRybHHszlC2hC5oxTjZx7UAKrztWz4BmGUKcBNdd4g6dbVB5YoNYg1Fw5obkTOHs37eoY1Ic7NgTKoZwPh+VS0XbDFUU7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745610; c=relaxed/simple;
	bh=eM+2IXPLksQPCk10H6wLTPEFYw72blRBRBIFKEqHrfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dE3Nr0/7daW9AkA2eckRHzFNMhx2x1h1h5ePAkgIMDYUIrWeSQ/hoE4PngqQlOYNBQNpvBuHbt/k5I2T8Oignuvg3+bBDZSDKYMcMNy5MoN3lid1xh9ZRoLmZgR2qLfJ3aae1j+DKDCmot6nbQbJ5CQdiNtVnwd9kzFlsBNNIz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqR7pNns; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqR7pNns"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso9213795ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787745608; x=1788350408; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKmdjRPRpgrPNsYFGU3ypH80W/86kIrxtmbI4pD7Jx0=;
        b=LqR7pNnsE52lUNxhQJ8kNfHctryRrJql8way9RyFMaloyissb3BFEN97FdJEDjp2ZN
         1t6hKgQ1zuxD1P3X3S9ZriqUVGSl2FxFbJGvurEV8gXqo7XdiDVpTjNXmX8Eeix5/g2x
         X7dAFKijXSjW8pamowESUwAE+aRNSQcktH3XKrKJlfpBTT+THv9ClsI0mmmq0k/CqLJu
         V8FwovH8zsQek9mDrICH6KgaanTY02NRKaT0mL7oTIDFhZKLPDYQ4b2qgNk4MWdqtkx1
         4xpRCI3GVqhLADFWDcKTbOQcGMvrXyuHPcMzIzCOePBbyHBNer+RrqL83Ta0/JFesyDX
         l2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745608; x=1788350408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKmdjRPRpgrPNsYFGU3ypH80W/86kIrxtmbI4pD7Jx0=;
        b=gcQ0abBrZlvr3YnCRhCFnaXevJTasCbFjoJg9SHmnwQ35Mxh4V/xf1Uh+pdrJtcjwr
         jVQAigEaegV7Bdzk6gTCpvkR1Wx8D7M+cG0xk/LDgPFf0FPBNYw329/1KL+OhKr2g/UK
         c/gFccDoLDAqCXNaBFxgmHKySdPmqmADg4RfVHCpsF32d7tWd4STySjKD6OyOzn3bLhg
         5mxPvVPAloW/wDQscq7oBPtSFMnTWYAsdAA0ZCEgLh2ipt/P3Swch4cLMb3CFzf5R5ba
         1kDThXG8q1iDw40TSjPp/VcFNiQfh4haruXd7WdMHzAopwJpOYF8iP2LD6ekyDMBc1YB
         72CA==
X-Gm-Message-State: AFuF++mEBA4xLFO4AQ0DFbHSEg174HqsZ4Q4Fpfc6QXMcjFBgUU6/Lma
	R+LNRASjirXOxbiYUQm+nb1JKuS8sXu3toE8GOuV+8wiFi08BXirZpMI
X-Gm-Gg: AR+sD12gfJ18nzHYxwb13uI7CchanHPzoRKd1Zh/EJ18H6rLKLUGwuu4r+3BylklSUh
	1X7TC3M2dwANv2uunVbZcPW1rIqNGgOuQ/eKBDAnmrJuj7r3lYyBdxJtZEoQvORmEPsGjmfJCXU
	+/ZdkdfcqMvAa6i4Tj9WBthZ2T/GPeQSZ0zBzosFZ77xBHZNbyLUcugxkCJ6XUh3867BThTxXkG
	zQPTm+8krJJzeRCG8aqEh6zyN0XitiJIxRp8xUal/d/TnKhCaANhEIqjGnRFLcXocLQLnKFnEqz
	xBfKBxZpV77gkr9KVGscuMZWmajeg5jIJ+oUq5aRnApubxEmntY9DUzC2+HPMPNVEeCpyRPmlg8
	xd/5mBPHowD0C8RJnC916XAT7WTDoKIPvSRVaRII6INzPdp0wq+Zq+CACSwmpGqF/s8ExmzLhvB
	9S+FV8wePCIGgxfJhflpDkDlCLZPSIk03D/cxn61U0PdRXBhoLW2JUNl4AislceY7+rAWLf99g9
	h9QBEEFV9E=
X-Received: by 2002:a17:902:f70f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2d707b7f68emr112387745ad.9.1787745607765;
        Wed, 26 Aug 2026 05:00:07 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d9edd8esm7655079eec.27.2026.08.26.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:00:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: sashiko-reviews@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: Test the PV_UNHALT feature, not just its CPUID bit
Date: Wed, 26 Aug 2026 17:29:44 +0530
Message-ID: <20260826115944.2882320-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260826101627.2873660-1-hemanth.selam@gmail.com>
References: <20260826101627.2873660-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please ignore this version, the report about the hypercall arguments is
correct.  KVM takes the APIC ID to kick in a1, as kvm_kick_cpu() does, so
this asked for APIC ID 0 to be kicked and only passed because the halting
vCPU was vCPU 0.

v2 halts on a vCPU with a non-zero APIC ID so that a kick sent to the wrong
vCPU can no longer pass by accident, and I confirmed that reintroducing the
v1 argument order makes it fail:

  https://lore.kernel.org/all/20260826115900.2882139-1-hemanth.selam@gmail.com

Sorry for the noise.

Hemanth
