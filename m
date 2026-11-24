Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536292;
	b=j8ccTdmzmzY1f3QwdShctKR/2qhv0SpwAY+ZXe7I6Wmh/2Sz3YKfQsm4rX7TmuE3Q3Gp
	 3lEtsQ0o+1Th3VRPR7eV5fBkEJ2Y/9PErGXSRyvbb19WK0/6Jj4ks86AdZjZgmtKXzXHg
	 xFdkPl5sfMqmDqSp/jYknzuA0O0WSvuEuaoR4ElNW3f6UbZ9piFcLcQGqefbyhX2obv/C
	 FMqcKSGFQbVcnl1wc2Ocp7lUDka+HO7gzdF0Rz18I6e7kaYuHMJV4C7B5KujIKDTtghk6
	 eUpFjESwfXjnbxTkin4JX+AB2QkkyUgZ6IGWbGLGbVB1pdVjqKGAlK1D1XF6dD/iSzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KezQ9tNMTEpbIH1UNsI1azAaM3sJdlBpXzC0uPhlAnQ=;
	b=JiYoxjjb5pNWtYtuthiAHsPwZUZ0aFiP3aT4NoOLkn6kF4bcQuviJI33A2zGKcmoPcsO
	 4vrYK1Q7LnZYxgDBgfyRKX3m2stebAQgRthW5sDQeLCJWhAAQJ04yGUWwz0+GLidk2chx
	 5y1N00twRVLI8rvnd9jGL3hNcKO1KqnPJhnprk0Fm/X0RLivWcFy+nU/JD9jgFYMnLMud
	 2xOAqLfNItOA0ItoYMtwjJ9117i8kTKsZ/LQBgN9XQRgewWkXcr5Cy0IDQjHLJaOdiIaM
	 62L6SNG9wnkOq+DIDt4Aa7amoPQaR3J5V+wJo6EX3Memp3e4TkSJ1cXqkLp0nOVWiwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=jGXcpdSV;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA021606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 16:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA021606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=jGXcpdSV
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2963894f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 08:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795536290; x=1796141090; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KezQ9tNMTEpbIH1UNsI1azAaM3sJdlBpXzC0uPhlAnQ=;
        b=jGXcpdSVnP0l2R4QPBRp2pL5ATA9IF7AewIPf/3yT/nV685AI8hLPBN4tHM5lbUiq8
         AhCSzwUAuNNiX1jpQI7OzX3whDqIdkP/8RSTTd/4qRaVe7Q7VO9E/Hhf5EkZL8UOBuly
         9vkG+ndFU+M/gXexoosVdUxGHXGPi+Cb4gZkwYc0IR8Yeo1jP0qLYy/tFwXM2MQr14OK
         NKeqfgu02PrtCEhkiblUjQp2T5vL85atAGfCE8IqOvC9sD9ozDYK9EojyJuvxFqqOIPI
         6YplxXt5yDDC9aynKNyh4xCCQddJlETE6DHr1ZP9ysuT8yHEF2LaJM5QzbksFMuWatwo
         FXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536290; x=1796141090;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KezQ9tNMTEpbIH1UNsI1azAaM3sJdlBpXzC0uPhlAnQ=;
        b=vy01aN29+vaPaDS2Yiow5KmeTbN47X7zxpNtfg7Rn3UEvkT3o6qAffikhBLxFvhnrm
         UxlW4/ejnm42B3dC+jD3dZiWXVBzqV0KjjDVl58gd+JN53feYkjK2vdpK2wbw8Tq0c2i
         mVomcAylgYudyq9h/Ffr7qqMERL/KQpUtMQg/1pfNICVQ+xIvYWGWIcfIe1bVz+UbH0i
         +WNxnsVqx2eHkBU4bKv6xvJmG2MHOsxnxQLOPH53+cpdm6lK1Gi+tJ3AF5MRjy1cq9KH
         Yw6aMhmTCF1QBDKlRh7Wvwb7YW8ylSls5xo223bAqHHdrO7Ld3UirOcvJqASgnW6ARID
         SixQ==
X-Gm-Message-State: APuU4Z/HtVDQok8XcP4xJnmVaquUl/CirMqxLKpDr5ozLvT+bjLy6y7B
	C48hX6+/MzvGh6fYzDQ49FYTFmpywYXH9zyNS2qSe8CaFDeUmr760/WpYue6zcgc6KOfIK6G5EI
	q9APErz/7FA==
X-Gm-Gg: AZFdTZcpLkLKcVm/LLlFFu1PZ3QeL2iAm5mzN5g9PZPAnRW08KWGFGErvAyxb9CFUKn
	3X66OiJGR4hbkZRZUGqshlAuhQRaCBk2CFQfknf9v1e6l3CglRwZeowssk4GrukoazyB5Vj6Ep/
	NqsYhTwkPRpMHt03xoI8oEJRV1mWvfRr+wxYHhMjhagVtgaAav+wCUXAmugmJIB60hGuKmjRpan
	+nybGWmH0Q9XQ1O2SH2SGKngqXFFt6MRvSlUkKbJLS2d3IUyXUwFpgY4kTLZhPO3yioJ1tZ8vgx
	MtI1ysn+x/58nXR9tCvKGdUD/n+r3mTuYeX0uRjyamE1T9u5DyHF/6kjyWr4v4XYorN7xx/FsmI
	8EPnrYW8uBHzkJ9jD9SqdqsFwgllDKAAbgdnOkYm+C3cbAf7F95f5jhUXEP/Wc1tY+JiYUvS+4Z
	BMpBRrHU4BHJTbPCtHsLOhDnZiS6f+NGoc6xNrc7SApPofHIW4D80mpWErPNhNUz8ku7FAvA5YU
	0VfAAP81NY1v+6ztNQaGsLZgcCBpVBNhXMWMI7ZN6zG4eg6IfEzzt6pjtEsS+ynCWY5BrgdOZ1E
	CQJWQ+H58Rrsno8dIhYVJKQU5QjQdRz48qYhjClCdsAREAoOs4Shfbxok0jGRoXoNNr9AXx6nut
	qiVwn
X-Received: by 2002:a05:600c:1c11:b0:4a1:e57b:667c with SMTP id 5b1f17b1804b1-4bb8881c357mr345245525e9.26.1795536290208;
        Tue, 24 Nov 2026 08:04:50 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm405101745e9.4.2026.11.24.08.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:04:48 -0800 (PST)
Message-ID: <384d2102-c2e8-4363-ba4d-24c045524410@blackwall.org>
Date: Tue, 24 Nov 2026 18:04:48 +0200
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC bpf-next 3/4] bpf: support bpf_sk_assign in netkit tx
 path
Content-Language: en-US, bg
To: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
References: <20261124151244.1423343-1-razor@blackwall.org>
 <20261124151244.1423343-4-razor@blackwall.org>
 <sashiko-outbox-231505@kernel.org>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <sashiko-outbox-231505@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 17:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] bpf: missing L3/L4 protocol validation in bpf_sk_assign() and
>    inet_steal_sock()
> - [High] bpf: prefetched socket in netkit_xmit() not orphaned on forward
>    or xnet
> --
[snip]

Both are pre-existing and noted in the cover letter. They're not introduced by
this set.

Cheers,
  Nik

