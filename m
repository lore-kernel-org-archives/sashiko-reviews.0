Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4DD2F747A
	for <sashiko-reviews@lists.linux.dev>; Thu, 27 Aug 2026 04:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787806106; cv=none; b=Mknn7hpcTUBDY8zBLGCjkPs4rvtUx4p9OeXrXH0DQVy/QiNRCCrwAtL3vpndZy5Y1FbRrRz2Bts4YM7Bq5D7JyckrlErAaegGQRsX7kOezmrdv18eMhIMdXj/FkYZZJVcxBfZqMm+J+KJHXUqBsacfw9JftOMUdKKs/lQu3kuik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787806106; c=relaxed/simple;
	bh=WJu5HTRzik9JIFk2qriT0YD3wfvF9y0NeUb+PtTrNcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMYFLlVWgfed+fmEQ6qGWXCvQxopfE35L5MtN01KvF3qLutY4psf36qwu/6Kc1LnRf4huHSFhfUuDiG0M0Ttqjq9NdTc94AUXvxSrtR5dDMLPUjSoUw7qNl6bzo1V8sIEIoPi8Oav1fcNJtA2wK/Qekf63Hy75l4Ch2Cw5XoBNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noA0XEPd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noA0XEPd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d71ae3455aso16066545ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 21:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787806104; x=1788410904; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qi+er7bYOUcgVSzA3zCVsVfsxzfy0NpHAMb4Vh1V6sk=;
        b=noA0XEPdmnqM5mgI3bN5/FksnW/vhjC0hoIAEoRK08aeMWogor5M+rluSQN4HUpcOt
         KAbSIICFChPa8GYgnTIvv9HjgOGxUdD0qRptq5k0EL8WqGgDMxNW4NvW8fTBwjftwcOf
         oezFeW2XqTVlNqdYm0LKhAeWO/oMqQa6+ETI10TBbYZySVx7GkdIufmDiCEyg9ULM4Oj
         4O8WU9F4B47QriQWQhOcitZkE+mrisj5ugn8wB/sZfODqlpm/Z+Tso358f1LQJQdJFZI
         1eq/MQKgkgJ1EJZtp4LFzYpYx45132bKYetO4PcW/LNoN9bQkn3bFhwdBe2tmMwe64u3
         9S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787806104; x=1788410904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qi+er7bYOUcgVSzA3zCVsVfsxzfy0NpHAMb4Vh1V6sk=;
        b=Axw/HkFNi9gPwpnz6BQzwoLTEWlOHyjS4HzK7hP8/VlbQi47bE5QOtpjCPnz96JHyM
         w3sj8VkyzZ2DJFoa0vb72CdPJosXZ+IEncolrY4DK21DhExiZXmoWQ7+QZV6EBAVs8h/
         WikvOfvYO/6nFgiju3iCHMMl2h/X2zVERRzU069Xvoqz1MrHOLDFUkA6VR3ccNGID8eT
         6fS7Er3GuggXWOVzG8PjkQF0egcvdpVlEoZs0PC5SrO2NEc2RKHNBAQnN8bUrR8t5UGD
         zO2QMRpP54CbgxsYnGZuqhyN1cBOhFVmCRPT3gu4tW8HkXsZiMOAtdiCVFqzWQO+o50y
         7+KQ==
X-Gm-Message-State: AFuF++n97waN3PF6CYmeUKr6mbH4zrzzW8sTFFLmWCuKLLxdI2VBRJmM
	V/SoX3dm5JPscaDtHkySLt/d941mg3bcSONGHFOOU1j3P8M/MnMQHjVy
X-Gm-Gg: AR+sD12NLD52toKEO86AuyZD852wLxyidQGMqJ6nLNbIa7Ubo4Qtwl/yR5MQ1loKc1A
	2QKr6Vf+ox1ldEC6EivrhzEgIBh2annd6IcsSiu9r3cZR1XcCtGsNvUHtFCEm6NCdkxINnSsKvc
	3tkmv9cFyHvm1qvmYP+yjIDSYfVy8KvEICZm46mYp/IUKx7HGUbriA1Pq4keZT83nCZpgLZ5pRR
	9DtDKCIdAxIriOyJdCs6DohwLm6s2KPtIuNUq1k+sK44/tT/o+4qU+zMBjzXbJWqx6IFa6254jO
	CkIpbsmOdEPorKqURpaU9AX806QAxQk8Vro4ftWAjSCnfK5BDirVve90IOTOf1k+Q4PeH+BzFMT
	Sdm9oYfOiVAHCejpdvZbrrH8FucsJQhKneXEHiBt7nMVtG7/C/ZY8CJegBT7+DGTRvaQ21/Tu4s
	RY3HGVs67Eqx9h/2RAtr6taF0h7su6YltowPgl/MNrzxC9Zf93Kj6qAbBDENXjlu2twNjgXj4Xu
	LRak2sgFSs=
X-Received: by 2002:a17:903:230d:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2d71e074bf5mr102128985ad.2.1787806104347;
        Wed, 26 Aug 2026 21:48:24 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d9e5fb1sm23000756eec.25.2026.08.26.21.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:48:23 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: sashiko-reviews@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: selftests: Add a helper to read a vCPU's APIC ID
Date: Thu, 27 Aug 2026 10:18:00 +0530
Message-ID: <20260827044800.2917294-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260826115915.2882221-1-hemanth.selam@gmail.com>
References: <20260826115915.2882221-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please skip this version, the report is right: the helper applied the xAPIC
shift and mask unconditionally, so it returned 0 for a vCPU in x2APIC mode
on a VM that enabled KVM_X2APIC_API_USE_32BIT_IDS, and truncated IDs above
255.

v3 handles both modes and I checked it against every way KVM reports an ID,
including a vCPU with ID 300 and a guest that renames its own xAPIC ID:

  https://lore.kernel.org/all/20260827044534.2900285-1-hemanth.selam@gmail.com

Hemanth
