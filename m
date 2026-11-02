Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793578675;
	b=WpAfN00X6ltUq2NgxAYE7hEElt0hEBxObb5Fl+WB7DipSxELou8aCnM32zYEgd0B9E8E
	 XkptAw4xv3EwbKgMBsWraZHKc0tDYKS1aLmwZgEQswIgZH/FKjr2DQQGkYWB9NahNELpR
	 oGIZHZM31GUUg5xXSgejlhUFY2mtfYf0iM8JcGQY2WkELN8GqSu14USklYoryeB6k/Hah
	 wdhaLgSvXstjUmSIIyA7zB0aJ2VlCgkilMNTlrwuozjQekrYOadAQWOVNq/7OssNbabMA
	 SqgzEMHTqX223UCqLqoch451C4ieFt7BfwXV+Pi1xCNcFk2S2t0cW/irK7UEVTZg0FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793578675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OwpIzVCkDZcH3jbzH5HRsFx6n0SAUwWodTFAghsx2FQ=;
	b=okzpDHQbcvCzygvxXHIBl7b1K+ZKB68TDnfY5Mosn1njUL8cQ5zUeJ2H+oXgvKhE/jBO
	 WvqGvinYTAWgbh09Sj1DbGK8Mgb3ntzt4h95ul7L66BgoNIZya43Q/D+ZpYDxHXMhA3ri
	 z/oggsHzK1tlVT/yXt8h2NPHZajSzBf9ZtHvlzIoDBM3wK9BRZmzjLU3zT3afYGxfME2I
	 QfMnmc4iuGHyddblCEGilNmfH4uaamxwUy+cOboSixtnjgTPMJxVbgvoJulxFBkESkUhK
	 tGBqsU6yF2jxoIDPwCcWTScRblE5qMwtwTNk69vIURdEkC3fR2Pw7S6bmofF4NndzJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucwq2g9W;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBBA606A327
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 00:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFBBA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucwq2g9W
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea138a3497so14290125ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 16:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793578674; x=1794183474; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwpIzVCkDZcH3jbzH5HRsFx6n0SAUwWodTFAghsx2FQ=;
        b=ucwq2g9WcNL5ojPMUjki7KUzpmldDu4CQ1HXcvSJNnzTjDvIrfNN51MQsAUhopDeyA
         DVl3lqTlSiTqFjiiHrI0zYl+l6m+OydZb8n9oLp9vLsRxSY0wxrybDvv+wW0e+c3Iq5+
         BkHnTaUSg/VcXbQzOMaiUtZsNPA8w8uA9pjA5lKdmU/4qE5/IdZeGnUQtivyO7AjZxUa
         jawtrzVwRsaYkifRBDwFa2eg0/P5+Yc+7eglwy1v1ZRj+4dh9YsOok9mveJZgnrHofXx
         z3yvs4f8ltKxVCuCGDZNS5yZwH2kjBadarlBMgCDt6u0CVQpYLA/TueUXweMyLWw8tbc
         5T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793578674; x=1794183474;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwpIzVCkDZcH3jbzH5HRsFx6n0SAUwWodTFAghsx2FQ=;
        b=FrsVlI/VCQD4eKBxBmeJ9y19MJ42HgZT88MSNWGfTF7G4XlMod3bXlIw0YezPBLAF7
         aDmz73C5v+sABWhR8UVZM/OidSTSJhbYd1zFvpWld+zI7rjfHg2gW8qquNYF6JC9IUxo
         V2dRUs6G1MaQA1Eb3c2k8+Gl0WO4UDub/752jppa0HiT+WujHWrvULKihmPj5TAizC1Z
         qXkRCaqjuxg6gBO2FrzsjrhLzVuTShQnDF62BPc7qHMeOz8VTtQOksaHavhmXAba8o3X
         9EYo5QNL7oEjqHyAJ+EJIgLXJg0TqzBC/dRT5l0jcy2yiOnKcjCkYqbrw+1bU3vyd9CT
         ifGA==
X-Gm-Message-State: APuU4Z9FO9UOi1wXxWhjRt6jIpVDNhT0ma15t3EQLHb7L14pZZGly4mn
	x6CjGv6k42Wvne4G9OUZAGh8eIndlBpK0ms2QeXSJHUMmuguWMejQSa5kqp8NQ==
X-Gm-Gg: AYBFou1OXeZ38Wb5FTrGxO0QA+lTSvBiSEYH/8sxrdHCkLpaqzjFd0CFOKQM1ME6S3g
	vyBX5m7+QjsNym/5guawlwiOHSZX+TqUtJeRbvD/u/4xijCxVetCJohpLpU6cpd9Lokw7HztcsO
	KPDPR8hl1MW1LvErBNy40W677Z+YBTubxVApOpXQxPXjjcUwIG0/J9AL79aIJ3YdFDf56cdkdxR
	uXecPLmATC53Wl0S6Ym0oK6PXJVym0Y30YFg/WHv7lwkEQ08ODtlEHQwSvN9la6OiBdbYHWR6sC
	3GLpPilvpQWq2KYd1ZWyon1k8eEdh9vK4eVDN4+w1n+2ay+/I7tmdfkXJOx6HoUlA4fsXt19PKm
	Sze2+GVpjza4diwJuT+1AR6ttUDzHrZD/SXzVPswP/Rqrf/sV/5P0Lps/WuIqADxDgKmRTSVlps
	/JNDC8o0dN2mVdws0aZcyv7fVYmavoF8cGb/cbwwpOutC+jC4WRr9o6aSIPevRz96y4rXxk6P1h
	ckGhW8TCcWTEgacyrZeW6lSy3+9xkTFsryPp8rJdA0uJLzrOy+EtZqrtu1jtGzcQzBNnUs4lTid
	c1IpehCDKsRchl0G5AUr9Xca+p9rnico30j5orWADZqKNzoWx/x48ccnaxI3LTruXAmTF7kGgRl
	4NIL8nVuXEBu28WF6erLRkFnvBlqQvyjsZbRaJ7oey0W/EKuzUy25pVI=
X-Received: by 2002:a17:90b:52cd:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3ae897ccacemr6470813a91.12.1793578674003;
        Sun, 01 Nov 2026 16:17:54 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm15965674a91.9.2026.11.01.16.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 16:17:53 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 00:17:53 +0000
Message-Id: <DMKAKRM51QKN.34OI7DN57OAV7@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, <bpf@vger.kernel.org>
Cc: <mptcp@lists.linux.dev>
Subject: Re: [PATCH bpf 06/15] bpf, sockmap: Give no progs to a TCP listener
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <sashiko-outbox-192637@kernel.org>
References: <20261101192057.2296489-1-alexei.starovoitov@gmail.com> <20261101192057.2296489-7-alexei.starovoitov@gmail.com> <sashiko-outbox-192637@kernel.org>
Content-Transfer-Encoding: 8bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 11:51 AM sashiko-bot@kernel.org <sashiko-bot@kernel.org> wrote:
>> +	if (sk_is_tcp(sk) && sk->sk_state == TCP_LISTEN)
>> +		goto no_progs;
>
> Because sock_map_del_link() checks the unlinked map's progs rather than
> whether that map actually installed programs on psock, won't removing the
> socket from Map B stop Map A's active verdict or parser callbacks (and
> potentially call sk_psock_stop_strp() on an uninitialized strparser if
> Map B had a stream_parser while Map A only had a verdict program)?

Not from this patch. sock_map_del_link() looks at the progs that the map
has at the time of the delete. Add a socket to map B, attach a prog to
map B, delete the socket. That stops the progs of map A today.
strp_stop() only sets a flag, and sk_psock_done_strp() checks
SK_PSOCK_RX_STRP_ENABLED.

> Wouldn't sock_map_link() then see TCP_CLOSE instead of TCP_LISTEN, skip
> the goto no_progs branch, and attach the map's programs and callbacks to a
> socket that can subsequently re-enter TCP_LISTEN?

It doesn't matter. connect(), connect(AF_UNSPEC), listen() gets to the
same state without a race. The tcp_bpf_clone() hunk is for such sockets.

>> +	if (!is_insidevar(prot, tcp_bpf_prots))
>> +		return;
>
> If sock_copy() copies the already-restored sk_prot alongside the
> not-yet-restored sk_data_ready or sk_write_space, won't
> is_insidevar(prot, tcp_bpf_prots) evaluate to false in tcp_bpf_clone(),
> leaving the child socket with the psock callbacks and allowing the same
> unbounded self-recursion if the child is later added to a sockmap?

The window is there, but it's tiny and it's not from this patch.

> How does a socket that transitions from TCP_ESTABLISHED to TCP_LISTEN while
> remaining in a sockmap wake up accept() when new connections arrive?

It doesn't. It's an old bug, not from this patch.
