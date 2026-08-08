Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E3DF6C
	for <sashiko-reviews@lists.linux.dev>; Sat,  8 Aug 2026 00:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786147578; cv=none; b=tF05BS6keozdjaJIM8oT7iTja4dU3nh1LgcEaDKFT6JJqmTXRTUKEWUPOzz9cM1NTLv6+TuhV4WH6HB2v8Rbodq2a9F/zJAtJ6iAf8g8vyJD0PJi8vEHyGfc9iElmECrmGmU9q5Sq2ELu4/6EPHuouYHmLNoukBOxEdBf7Kocj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786147578; c=relaxed/simple;
	bh=RA9dpZdl+10Up3XzK3DGdcx1jVQ+IhPwZrWXOdRKznw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umOnoqZZ+hXYL8kwuWilfCBwhXEI4q7lrIKmkfCu8LPb7OLQSmqcaA78TBnYv0zg0pCcvkRq7OA+I9ItadaudEPilwERYgFCK046N4tLf1uMJCbUyA6/4Ek+oUm2yldKC/+pQxSUu6IPPr0dXeky+t96vgaPNfVDzEb0p/ue2fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kImvm1FI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kImvm1FI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so896255e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 17:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786147575; x=1786752375; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsKxTA4erx5XTSXjiZYThiZPnvpnWuQr1XWMu+ae7cQ=;
        b=kImvm1FIjsySWa+G05/XiRLOZbT4XnbKHnVXoObD7ttVwGvBS/rrJ5jQa3fmouVlLu
         ERIyj42CwJnqX2pPbdGGN/7qgXYqk24HQj70FEXncul5Vqwh66888WUbhpd6TDv/KdLB
         j5pzUTMREJ2R9kJmrU9zwq8zc+GTLg+kZC6X2j4ofca2NhQ1svc3q0uJL9RP2QjsBw27
         B79iwdcBfzBUTxT8cpTO6P8VDyAH9FsH+vwTer3es72r3bYnhSO6tNdiu8X7BU9CLPcE
         X1HgyNqccdTBmrx9X0wmaD6qJ9XjZAC/5SA/QpgmMyPVjD7LnLjpEVj2oolZTw2RHdLj
         nOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786147575; x=1786752375;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FsKxTA4erx5XTSXjiZYThiZPnvpnWuQr1XWMu+ae7cQ=;
        b=fMCNaP5KyakksdS2OKNlGLFZJ/MmKBLqs4rm8GCQxvv+ZGql0Ft2TgXEvEZ7B0hHW2
         iULqMTfX7UTIfqXfGp9X9y+v63eta8MsHd9Frxf3uZdnV2SvnB2+mC9dFjWfexbxyVRs
         cqup8HZ9yzy8rrguc8caMnYS28gBofs2RsRNoj9I9AMmpHlnsKqo3rADI2tMwmKw8pEm
         aefkayc/GhXoeQxzGTwlI7+etwLMt51y7G4nOsZd5plpVJeQH71t8Kqz6SJt7nYP7iFP
         2MibDC+/ledkvC5s7+M6dYNwTXrRf1MmmrLXlzi6VABl2XJixy7gHWQtXGw7cpuKp1lx
         pBXw==
X-Gm-Message-State: AOJu0YypBmW/r+UyKC9ZRoC90nG6EEM9jvDcjObUov4FR97y0JyaN3Nl
	+5RCICXrj9lypeF5+7Certl+QaWVHYheWlWqhDqh+tbqvZ9W/P7Z5BD3nnG4sMYO
X-Gm-Gg: AR+sD1130hAE5ElcgCnwBP55YaCUInwEXa/02oII+Y85SmZdg0Ru6MxxcbKyI3/btdT
	N7yWcBz3Un0sdiC0hv1o/9bOzkulAtKQDZZKI9Th7r1pBOwpNVpov86hFv81KVPnXlwd/VsxKiz
	xIBKg39wX/gbUqknZdPoTCzUCV9YoDfWVmYAfIFxNjM8/4Y6ynP5BaXcSK5q/h2Pe8du0D6enaC
	vdTYKFR7AeGJ4KpkPzkOEdPK9cgOWzbReGJrYx9k4yE1pbuT4O45/78xO849o5EFGGDeke0VMws
	oIME0hQnpV7ZRZ19kfp/Lgw66gbYyyhFjo/nVQprT6Xf5GNINuJSkG8kWDRtZx7L9uSvnN6FH75
	MxZ+5XEuql3JDHglk1WvW9yL5eETUeDHmdLs/1/yL0+FKYIPGOm9SK06OwWs9QD8chrBslPkKWD
	ksxuJmZ+3YWIGpbV2JKhpvgBRk3DpG0lxOnjmooJOr0kI1faijlJ3JEQaRCdQSnb5rLkRUunG4F
	h2a9l9Rn6A5O8B70Gz491ezeZEQ0WjCDEsGRyuHJZ6GjMwFC84y4UeekQIL742raBqVI+UC6PrG
	wUQzo0jbYQCY5f7SfxT2HWWtL7tn04SJrqRTu+3AbzoiXf9L6vKvc/EtndkBpjr4Ew==
X-Received: by 2002:a05:600c:3b0a:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-4994e71d7b0mr327822895e9.5.1786147574972;
        Fri, 07 Aug 2026 17:06:14 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b105-e101-a437-493a-4de9-ee3e.310.pool.telefonica.de. [2a02:3100:b105:e101:a437:493a:4de9:ee3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995428f294sm193311215e9.15.2026.08.07.17.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:06:14 -0700 (PDT)
Date: Sat, 8 Aug 2026 02:06:12 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v4] KVM: arm64: nv: Keep the shadow S2 MMUs at fixed
 addresses
Message-ID: <anZyR30Zjj-DRJIF@gmail.com>
References: <20260807195940.12642-1-kmehltretter@gmail.com>
 <20260807201709.548941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807201709.548941F000E9@smtp.kernel.org>

On Fri, Aug 07, 2026 at 08:17:08PM +0100, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Medium] The `kvm->arch.nested_mmus` array is leaked if VM creation fails after `kvm_arch_init_vm()` completes successfully.
> 

This issue is valid. generic VM-creation failures after that point can
call kvm_arch_destroy_vm() without freeing it. I’ll add the missing 
kvfree(kvm->arch.nested_mmus) there in v5.

Thanks,
Karl
