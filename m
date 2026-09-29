Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83A529BDB5
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790645583; cv=none; b=haO4zIVOqoAXdQWmG/g4txpXk0Eh1gX2cOldHCOEHZ/0HQn6r3TremBXUu+xxhle8TItYe/6RN7Ro3IUfqkyYX8iIyd+FJ1uip+5P0qMkr4sQ0eGUYmIOmU0l8HkmIRhxAjNUYURE5cCmE+sqK0wYDuYOBIgddKZZz2JgGS2Xyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790645583; c=relaxed/simple;
	bh=kG1tyuyS+WItldZo2it0i/oxAx7WsLezMucv+Vpc6Rc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=AouSNDYLe6CoHV0MTjjzJR8bO8TetZqV5JEgtcErW/s+tcMvk0Edll5SOXlONVdE+jfJhzzbg/A7ml93ev4pgm5J0amO/1M4ExLYrbPj6//GmkbJjInOu9Vu6USaosOKEODlw6p5eYYMg/a9tJ2qNG6BZW9OwazbR0T/Aw3bilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1o/TTeu; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1o/TTeu"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-3468ec309afso1273753eec.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 18:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790645581; x=1791250381; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jE+ciqEVDFdZu7cLu52zi+3jRoMHY3EWj/NIdDttJpA=;
        b=S1o/TTeuVxN9pkmObu/GXFuWxZ5RY+l0yyWVKVGdVNGzWtBIU6UEhGOncrgfZy4T88
         cPoJWkGAbcRoTmxMdo1OpKLljG454VrmKia9AkfEDkdNvS1y/olEu9Mo3ybAf/nV7nW1
         BxKuTK+55ModRJWkc3L4JbhfHy6NeB5fB1MFJv+44gSHV4o2HPp2EosdzOEqtVXBV/t1
         Fn+U1Vat+TuC+Mb/XK4TFaA8Wa6i7wX/pMKtQyAu73BN4cixJT2FupcjArOyKbycwSnA
         /vM6PfO6lN/ku8xp6rm/q93L5mQ8l9dnP13MBT8D4wH3ajq6yTN4CMJj1YRshX1H8ooG
         /e5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790645581; x=1791250381;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jE+ciqEVDFdZu7cLu52zi+3jRoMHY3EWj/NIdDttJpA=;
        b=fjK8WXJ33HykjjRKdpXJP9wTgZFcPPByV60E1zUJg37amdxktDkd1+rArzqjAaik/L
         334Qb8oWS4wYaBx7PUs6Wk9KszgoVYU//ZchnDdCabkhzK4T5cxptlNusBlbI8GcdblN
         /NrPXlaScq5KW05a5msyFrEXNOfr1in6dyrxqgZbMHK2rGCOEuEjmss0KT8C1xo+gzdc
         ZZe6ZMoX4ZlKpPu90igM8ssfiJHgkqrIcpABINLz62Aq4nvpqVionfA9f0mcMcRsvXQ+
         DbBAvJvpP+q7xrBhjsi05EDkazKWAp3f6sYpgHIhxsqfAN2YJ9/QuSRS+azw6NprEKc1
         kuTA==
X-Gm-Message-State: AFq9FYJTs01rFAAhtx9GQq10QAut2EE55cBqmK0oonh+U3GaufAmDKtR
	2Nsz1wsNfuaZrz4d4Zw3g04Y4bs2QyKaDatBX+Goq2yed8CCFzHhfmbY
X-Gm-Gg: AYBFou1dDSCXC/9p4ICNjZNGiSaIB1PThsNPDrZ121EcJxRIVZq63VTQ80ml6JZ17KY
	IJHzWoGJhDVPLR10teTMycd5sl4qXtBGFJ8QRUBvn+DCPPZy4eyD7VKNL+rlzQGCEQaPmVxZcNx
	aYFe3qqrtP9hnQOp2kpCfX+xNb7JYKA7LUAeOZv1wKCrqCYnJkTdVhnerIsswOLy2/v8AOAP9LQ
	c/N6D4JwbPseNxVah8jCOEuhJXlnQL2o2LeMpE+1igd5KcFtyoUGqr818aS0m46qFPb/7NwHSn0
	iMYM/SaoErmfxptt57JyPUITUjCcB8BYAXtF3SZ/tJz6E5Q5cNS3ZVQZ17bCFhne5lo7aRt6OPm
	1ucYjMNe/3ZbYNT8KgdabdggVXUBrjwcLt/n6JwO+N8GCnH07fDIAEsITztzU+XVrUczlsAXTSa
	UkexDphZRIzvkCa8pL0R+m767K254DQ2VgbkBs7beWGMeX7NWI14ZTOy7NcHLIRINgPIGVB1itf
	MW2O3qDeEx45tpXHL6+QRBtlOO3gx4PKVJ7AsdlcYeDQ0pzJVQWf1A=
X-Received: by 2002:a05:693c:8953:10b0:346:7bfd:8504 with SMTP id 5a478bee46e88-3467bfd8655mr7218954eec.41.1790645580580;
        Mon, 28 Sep 2026 18:33:00 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34b580fc50asm466353eec.14.2026.09.28.18.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:32:59 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v5 1/9] KVM: PPC: selftests: add support for powerpc
In-Reply-To: <20260922184312.9FAAB1F000FF@smtp.kernel.org>
Date: Tue, 29 Sep 2026 06:41:49 +0530
Message-ID: <qzickgiy.ritesh.list@gmail.com>
References: <cover.1790101179.git.ritesh.list@gmail.com> <de328dc973a135a956a148dd83d8353b7157d452.1790101179.git.ritesh.list@gmail.com> <20260922184312.9FAAB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] kvm: selftests: missing save/restore of %r1 and %r2 in ex_regs
> --
>
> commit 2e259a0445aae14d6a7262b100f4677735b2217f
> Author: Nicholas Piggin <npiggin@gmail.com>
>
> KVM: PPC: selftests: add support for powerpc
>
> This commit implements KVM selftests support for powerpc (Book3S-64). It
> provides virtual memory implementation for the radix MMU, ucalls using an
> unsupported PAPR hcall number, and real-mode guest interrupts.
>
> Link: https://lore.kernel.org/linuxppc-dev/cover.1781093720.git.ritesh.list@gmail.com/
>
>> diff --git a/tools/testing/selftests/kvm/lib/powerpc/handlers.S b/tools/testing/selftests/kvm/lib/powerpc/handlers.S
>> new file mode 100644
>> index 0000000000000..b860f6a520a13
>> --- /dev/null
>> +++ b/tools/testing/selftests/kvm/lib/powerpc/handlers.S
>
> [ ... ]
>
>> +virt_handle_interrupt:
>> +	stdu	%r1,-INT_FRAME_SIZE(%r1)
>> +	mr	%r3,%r31
>
> [ ... ]
>
>> +	mtxer	%r8
>> +	mtcr	%r9
>> +reg=4
>> +	ld	%r0,(0*8)(%r31)
>> +	ld	%r3,(3*8)(%r31)
>> +.rept 28
>> +	ld	reg,(reg*8)(%r31)
>> +	reg=reg+1
>> +.endr
>
> [Severity: Medium]
> Does this restore loop in virt_handle_interrupt intentionally skip restoring
> %r1 (stack pointer) and %r2 (TOC base)?
>
> Because the loop starts at reg=4 and ends at %r31, any changes made to the
> stack pointer or TOC base by the C exception handler in the ex_regs
> structure will be silently ignored when returning to the guest.
>

That is intentional since it is unnecessary.


>> +	addi	%r1,%r1,INT_FRAME_SIZE
>> +	rfid
>> +
>> +virt_handle_interrupt_p:
>> +	.llong virt_handle_interrupt
>> +
>> +handle_interrupt:
>> +reg=4
>> +.rept 28
>> +	std	reg,(reg*8)(%r13)
>> +	reg=reg+1
>> +.endr
>
> [Severity: Medium]
> Similarly, does handle_interrupt skip saving %r1 and %r2 into the ex_regs
> structure before routing to the C handler? 
>
> If a selftest takes an exception and attempts to inspect the interrupted
> stack or TOC by reading regs->gprs[1] or regs->gprs[2], won't it receive
> uninitialized values instead of the actual register states?
>

ditto. None of the tests depend on it.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1790101179.git.ritesh.list@gmail.com?part=1
