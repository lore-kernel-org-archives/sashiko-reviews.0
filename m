Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D931F986
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 19:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513318; cv=pass; b=SiNNptcDIpnH66m4OXmfj+aljflElXu5VgG3a5yxhm/EQGqINin8hSUSDrfITleeQqqJ1CBKnqOiDUoqMNLBsEjrzgTTMHx/BWs/gXl7WcUgwmlRQKF7lGTMDpbu0Rn/0kqySTTQP07UotptDBpEtXfGagTytLjDoA+hV5fB5/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513318; c=relaxed/simple;
	bh=Xc5kcfMakf+nJeCEsm2n26H/r2PF//roHh+fh1kcMqM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYRXB1C6Tq2Upolz9fDGS3Ur0rRHrPYpuqigodJx9ylhzOJjbxVpMmAuCgba1SGvuO8oKXLASE9XI9VDmra0z6ofRop8kFgEOb0sIYUO9Cfh9FIkhPkUSThtcTF05lzoJ9DnEFBpkzj2DmBYsFO+VXZmkovF5Q7BfpD7FUBVyPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jLpguWGu; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jLpguWGu"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137f0aa125bso4661183c88.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 12:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780513316; cv=none;
        d=google.com; s=arc-20240605;
        b=WyUsr6ZRlG4F8crtIoZ5Y2NJ1BF94YCxkw+Z9WABQQvbZDAWQrjMa9hBKLRF9moQ5o
         N8TPv8dLG4b5rM3rU/Ce1qfXqeL2EHxk93mkyO1Ol+9jjAkPXakxv/zB2hf6A5e3gC/O
         iloKr/vQmxOTmfZ7UUfb+yWUEur95Q+4WSsJoGsGvWBzCK4U/ux3qRMefYgh1uZCP//0
         ypE2Vacx5VrnDTOfQrf73MFiuj3QAsGnjUgWoCPjg0nvOH1malsPPO62agNn7C7M3rYB
         Bk1b5f8GgDLaeHfE90LHQ0v2ntryQNtrRACzB6FKexpxvXi4FSmjS4l/TxRxOJyorMvP
         amNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FrdppwqBUMbQkQbLbGXJfGioEcfkU9p7vcumdWWrqwE=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=FlJKyNpaaq7SYj+wYKIM/GbDM9H7iQ+3cizfFAAXdf2FKhJ2UnYek9MRLWC1M0TcKQ
         W93gFeHp15Kp4ilwLdsuaVP9VKsK/Zcl8BLCKkPCAWta9k+OlgD6wa2Zsla71ik2h7mW
         uDVZcz9D5+rnFl5vtxYCYK8dKRcOCAwb/y1oFGhWy5r0UrKvm4Spd/fMCjhF+fZubG/P
         pQoBL3IsGyj8Ghp937rkMcH1TQkCJY/k1SG/ovgazr6LaijYaBU2px41on3e6jZA8xL1
         A3OfjoauMFjTFsDesIyf+B9EZZoLKdb/s2+9Tr3EfAbPYlQBEod8CmsSsugWKy13lxPU
         bNKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780513316; x=1781118116; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrdppwqBUMbQkQbLbGXJfGioEcfkU9p7vcumdWWrqwE=;
        b=jLpguWGuD7eeY9n47j67Ur3Q/DMsd58yTohSYb6tN5k4qaJJ9t+kAAdNxwD71XyOKL
         cRqMOs3Sq1Z9UQpI6XGUSLKGTOA5hBpfcmwaP2G0LsP03hr7X56LkUXUg2NyQYUTp1u4
         Yfxv2XmKVu5O7PEb4yqyp5BwsiMUMcT/9t0Ae3+fMXxpdWK6qA6r2/JK35+vq9dqJLPd
         oA4Rs16WixfTeYmGFx/I8u4xclp4Nt10fhxkp8pEmB50vk+KwkHQV/YvLezP6PZTZoyn
         guCGu1X8lnyKkANOWLbVT4n1dn/vKdD5p3nnQ23+Owy1QFQ2Se7yvURyWkZr4U2ZkyWu
         hjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780513316; x=1781118116;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrdppwqBUMbQkQbLbGXJfGioEcfkU9p7vcumdWWrqwE=;
        b=R6Qp0Yg8B1oDYed7sXw8Kao6JRMB7nwIkK1CXil0sIDO7OQhxYHJaQ0lvcU8Mi5oTN
         fhGbcjgmUlAXnvEfdjAuHptimziOx237d6V9j3fwZphOe1fhLzv3L/da8pBj3CTEWxbY
         RZYztznPw8KcPGuP4D67UNlLxzH/yXD3ISKuPEWeJnC4RsRu7zSJO7tj7vVdz7zTlfDd
         YDj7+QhNn4pxviLADByYBizTtT9p0Jh0lmFGKJK1VkBN8WL09xR4Kqo+4lnXqzq2iGAg
         0MQvAjWx0QMMnlnIvVR7pqNWFmEpxomiEzyosSy8YRsb+luAQxPo1VMa4w6MJXsmDrdR
         FmEQ==
X-Gm-Message-State: AOJu0YyncC25g2hIstoje67U3ctCRpCVc6Kr7WzmVWvk2LdVftVy97VA
	76pkka64FM+jFDIRZh2N6G79nhqAcE38azIvYArAgUK+5/FVJH+pByoMroUZkyyWtIBDa/c6+bL
	QgGWxXe2vZFNMHNlLmH5XocmBTfhXp9g3SVBg++Wz9otxCHLUr0bI/14K
X-Gm-Gg: Acq92OHhMwVdBlP6z+ldrARyBKJKPWirCx3OWFPhCO4t7Om23T5s5FMs/9845ylzDbU
	KLJrmPstMz1BnRvb/C6k6oIVAOiMwDelYk6qLCRUOyv3EUTKKpzQ9pX3B1tjPToMhdieQtKZhaW
	29wfEsG0DQGd4TSsYk8+1iISGl2Brjdv0TCtAVKbWDJIaiSx3KumGJ/5rjdXcH1ETxZSFAR+L+H
	rsqB+ut97IUHXuBA0ggH0kE4BPOMEksz9MOFGT/eiv7l93rjfNNivwWzmRG/M9mSjbCxHxLcZVS
	65+hKb8sWeWA67FB3olsDOaqORmtg/C5iy3Ct+t5n6fmvRD40p17dHzTBiSxQXRgM9qtFWYhEPk
	3WA==
X-Received: by 2002:a05:7022:2390:b0:135:e312:47a4 with SMTP id
 a92af1059eb24-137f69382a9mr1895079c88.9.1780513313859; Wed, 03 Jun 2026
 12:01:53 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 12:01:52 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 12:01:52 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523013557.8DE1B1F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-37-2f0fae496530@google.com> <20260523013557.8DE1B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 3 Jun 2026 12:01:52 -0700
X-Gm-Features: AVHnY4KsbUCYkAg_J7QB9NZy7MzgdWA0kDAtfdN45OW6sA1mj4HkxgKzF-rW7mI
Message-ID: <CAEvNRgFWBWPKCPWQYCQ_14Ec+Z80jtU28+-ojAAh7rtr9AFwPA@mail.gmail.com>
Subject: Re: [PATCH v7 37/42] KVM: selftests: Provide common function to set
 memory attributes
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

sashiko-bot@kernel.org writes:

>
> [...snip...]
>
>> +static inline void vm_mem_set_memory_attributes(struct kvm_vm *vm, gpa_t gpa,
>> +						size_t size, u64 attrs)
>> +{
>> +	if (kvm_has_gmem_attributes) {
>> +		gpa_t end = gpa + size;
>> +		off_t fd_offset;
>> +		gpa_t addr;
>> +		size_t len;
>> +		int fd;
>> +
>> +		for (addr = gpa; addr < end; addr += len) {
>> +			fd = kvm_gpa_to_guest_memfd(vm, addr, &fd_offset, &len);
>
> [Severity: Medium]
> Does this unconditionally assume the memslot uses guest_memfd if the host
> supports KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES?
>
> Since kvm_has_gmem_attributes is a global capability check, it doesn't
> guarantee the specific memslot was created with the KVM_MEM_GUEST_MEMFD
> flag. For example, test_private_access_memslot_not_private() in
> private_mem_kvm_exits_test.c explicitly creates a memslot with flags = 0
> and then calls vm_mem_set_private().
>

I think calling vm_mem_set_memory_attributes on a address in a
non-guest_memfd memslot is something that the test author should be
alerted to ASAP, hence asserting and failing the test is the right thing
to do.

> Calling kvm_gpa_to_guest_memfd() here will trigger its internal TEST_ASSERT
> verifying the region flags, which causes the test to crash and breaks
> bisection.
>
> (Note: I see this is fixed later in the patch series by updating the test
> to skip when per-gmem attributes are active, but pointing this out since it
> breaks intermediate bisection.)
>
>>
>> [...snip...]
>>
