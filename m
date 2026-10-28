Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153717;
	b=oHqKVFh5b4aSCvjUQc1Wy5+x+xsfivL5JZ26SPOTacTQMzl3jdz0SHKFVPAv5tzyXff8
	 K73+BU82DTzUzvh/7at1FMgKcg9/lhRHFbpLnTpYgTO2BYSfTSQRZEJZNGwNORtDvWe/i
	 E1LOzd2qZktpIDLCC+KsyLqh+9PsnD2+Mz95N5kXpbcc8wg8+SFk+wEVwD/HJpBh1hWoc
	 xYFkb4yVnabosLeEy1H0oV3ACzACbCuyqcrQ6yxrRLjv2z9iJ2DB25MCOP+eiYuhXO/sQ
	 ltJwr163CIpLX1CkN+TT9bGIlE6ySvWQeIjE4A4dT67ZxfuReJxU422xLgVGsxC3NVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=1ADfswGVxohj7MztiMYH5hOPTibA0w5eZMckRPKzLHk=;
	b=CjLyO51iShEk3KZerYDmfUFYCbUITXwyyXPcNQPmWm5wjhgPRCnBY0nscly2lMF/Gt7M
	 jR4afKZEtZoOPzCS97yao9iolPCdJrtxL/isXVSyAouR6G3oU4+0iIeg7CkxCl4pHGue7
	 r5Pe8VphSGAxDo5ZL1JCzNfznpSY3JGq6c44WQ6/SrQFu+tRy5VC2fm4m8YEa4Gez4N6D
	 esISyWVOan8LE99HgQRs8lP9dGb3KfGWkygite2TqVQLl3+ddFvh9or8bZmMukFKywx87
	 B43YgynxXEfsj/qVdNG2NPzLyoi0H+GWbuh3K7rwvnaD8Wk6mrOWQTxi6mGbO1Dw2bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.225.133
Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C4B606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 02:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C4B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-49e7b06acb8so1972375e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 27 Oct 2026 19:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793153714; x=1793758514; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ADfswGVxohj7MztiMYH5hOPTibA0w5eZMckRPKzLHk=;
        b=hbBDsqcQ+9LxyAqYeigqpJh+Khj9CZv6hNLQ3cL5/WqNHzCA6reVNcNYH50ApCHA2K
         AgCHidqGdvzbm9oayIQhRFmt1Z2vSbH9cAWJui0lgnFXmdqL/blvXZBndkQAnCgJ6LmX
         AUlCDTnxlzYeh+8VvuuhRLol7f6Mfep2HUDmqZui2YC+vJgqRgWn4UjBCL0REDeNQXXG
         w2C9L+LFqdgKlL7NcfV+7Lu/WSQz820xOKtiHsSWWu8RX4l36ztoEUxSETIP524724kw
         l01+AhlSbFaCQqbmJ+t6Dz1W3c+4cU4JkPY2DHFWk0cdpWscMOdETMrIhJ+E28WcTHbi
         uzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793153714; x=1793758514;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ADfswGVxohj7MztiMYH5hOPTibA0w5eZMckRPKzLHk=;
        b=gEOIEyI5DLuUf1/055IvDCXhPPLcrsrsFmugFNA8AwUlTBhtqUOSVdTSsInoOZ7HlB
         syWoXhYrbj91M4WWVt3LlzH9MI+sCAXBbxPNGJ+xITth9odRf0mzU+l0e36047KjRI5l
         0FPDP0g2nhp9/aDhJEB1FIJhpQeFtBxveYU/+3rx9vzP1oKInBjQxilN181crO0wwrfE
         FYamfcch8EHbnLIrGFOGRX2v8xQcxNXaEeiHLj1lGuhoMur+LQAsUoxrdeLLlrSeRHvw
         BmHtXfLAF3aqFJyEwZlmrJ28carEX0e7J0NC65sLv1493E7dFqdTsPJvZ80W5W6VF1Bw
         uNgQ==
X-Gm-Message-State: AFq9FYLIGd1mw2ZwgFIyByLqP/nC1l3D0jS4FJr9YERqt9udxg8LlDRf
	kTqOFMQoMC9Szs+W9HI/lFV9o1Lh87Km3cCLAdOIJNQaNMekCi/EeEUgpx69Vlrt
X-Gm-Gg: AYBFou2yqcDJmqvnEBCXfARWzKsn6Udn0BP9KfYWQ4TjP7E618ehkbs9a6gPxCAFCzc
	24Uvyvunqp9GTxX+KU3Wj6vw0Gg1k01X0yPPmkWDNZ+WIBtU1yQi5dKG2WvKgKpwfOZD8Odl5Jc
	gveToiNkCikeK9nSJIruUwXkZvTcPfx4+DbzcVr9ZhQjhKwH0DUQuvGXpERi189xjy5MxjIPEVR
	Bq3rIl8pog41lE35jQL9d5PHyOmIhWKLXFJpbVl+SHpLf6nA4ublkU0GQjAH5rU/OJZooTxO4OD
	pO2Z5BiLQAAJvhqwCzyrnDvYMlFLoB+8BF3ZlSGjYUTI7uakGX8VzuxltdkUs/PxuJkMj3VkgfP
	y5WNFojszsogStfNeh2FDTocpd7qjiIotXpjrt/3r+r5/R6H+Y9VD7RiGDfd/5O4KiQVylBxtKh
	Nj/DiVy9NICr3/0qsx4ZgBECtAh5cioUBhfy/I835I0cO/Dha+3VE848XPrMP7mJaSDzEUpKI/J
	GNuzctbNjpiKp8GW4e7OyS+wxRF9gFBV/XHcuYkNzyLIzfTN3lc7MHW+VVCd2PSf7fZGHg5JXfi
	EHZjkS+FXGRHJqu+iBjy8LrdUZz4/n/Oi2ZEV/Ec78buU2WOS/mlyAZHyNqA6kN4Igp9/LVJzYI
	43aMl57FfrhGaTYhL3CNosKlial9fLvFMM/sP1cvC8tAajjuaVkUlh0ia29/iZzJ8Fw0g
X-Received: by 2002:a05:600c:19c8:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4a966c418a2mr16252535e9.17.1793153714136;
        Tue, 27 Oct 2026 19:15:14 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb40733sm20105198f8f.0.2026.10.27.19.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 19:15:13 -0700 (PDT)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next v1 04/11] bpf: Give the inlined bpf_loop a pad
Date: Wed, 28 Oct 2026 03:15:12 +0100
Message-ID: <20261028021512.1203900-4-memxor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-187304@kernel.org>
References: <cover.1793147364.git.memxor@gmail.com> <a9599f7ed1c7bbb5109d2a9e2c7135af15045738.1793147364.git.memxor@gmail.com> <sashiko-outbox-187304@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed Oct 28, 2026 at 2:10 AM CET, sashiko-bot wrote:
> [...]
> [Severity: High]
> Can this leave a live BPF_JMP32_A instruction targeting a dead caller landing
> pad that gets removed by bpf_opt_remove_dead_code(), leading to an
> out-of-bounds read in addrs[] or ctx->offset[] during JIT compilation?

Right: the pad of the caller is dead with a loop of no rounds, or with
an unwind_exit on a path the verifier never took, and the jump of the
inlined pad was left pointing into what the removal of dead code took
away. KASAN sees do_jit() read addrs[] past the end. The next version
gives the inlined loop a pad only when the verifier saw the pad of the
caller, with a test for the loop of no rounds.

> [...]
> [Severity: High]
> What happens if bpf_is_unwind_goto(&new_prog->insnsi[position + cnt]) is true,
> but pad is false (for example, when
> env->subprog_info[callback_subprogno].can_unwind is false, or when the
> caller's landing pad was not reached from this call site)?

The unwind_goto after the call becomes a no-op jump either way in the
next version, so it never follows the last insn of the loop.

> [...]
