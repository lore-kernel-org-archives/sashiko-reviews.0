Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057886;
	b=hlJS4k22puOsDSigQiqbiIqFnfW1tronVvRkMW3oXCSP7v9KQS2dACKBYvhr/EiZmIpg
	 Eu8HB/X12H5jK9v5AmFWAs8RdFFFBBrlEdgvHtlDtlVj9kR3WJYVKXq9F6vb8zcS9mcYh
	 S1QrBTUPRyxFUBlcWxVmHHQYKo85ZnsGMaQ7oou3HnOCmQhMsZJH9B/qJbMQZ9HvsoqoE
	 UpEZRcFWNy9HWq9xmjDlJuDBcIhM0JUkPu6Bd4WuNWUmVxq5GNW+JuSY/8e6dcoAVseVp
	 75KOF+8WbU4UdB2Xk+VnFgI9TqRrTiI5YAs/B1gBRnC9Ny2lsbNtM/1L4fq2TnY52pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=VH7ady2HZ4+2o2AB4BRmr/CzSYqljeaOTtIyqJxzjb8=;
	b=nkMQpJ2lY55bEhtOSXjB+FScu5GjdW1FmEDFkv7ksswCfRzZY/kjdllzYpUzNlTF0LpP
	 VpCtY/fQhzdxvJApfRPFWrphzJ1ZPuOThJ+DMDuIBV+1pHGzsBJoQqa4vAXo3bgxpTgpY
	 rouEVBMOtWzJ1vps4ofjS5AVb39OFalxdWmzydHby+MwoE77YposkUMUmgi30g35qQzq3
	 azm6bofy0IqgcQZb2MW9sn+/IDoxjBSf9ckBHi2v7shuwRjUiAOmnnSHCAgrmDvjNBB88
	 d0Pmaav8s3zV3JeNNDVYLKVPGj2RLRDZzdQa3wHwlJTUWJIPnBvBvtQAi5+6dXVmUyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hp0KIPAA;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674D8606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 13:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hp0KIPAA
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac96ba6a4eso219401a91.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 05:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057886; x=1794662686; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VH7ady2HZ4+2o2AB4BRmr/CzSYqljeaOTtIyqJxzjb8=;
        b=hp0KIPAA1uGk+g3g40VKEStdlRKXzWxkLGcWgVE0qfyZN8yPIYOc8F+Pxp0ViNIs1W
         DEnpC1iGHCuZSmLVKNGBSWnQlVVomsDmjml+v7a+zhFj76ZeEadsZQTn+Bt/VZ1HVYCK
         jA8Xz5pjGvEdZImqSVHxTwl5yAFisO8jVP+sLk2O/CHCNhqXG6nvt5MF/5XTlUHbshEz
         bv02K9/ytjSu5dILBrXnCHsxiJ6In578BKDNbw9sTdwLX/PEVkeJmpdoQGFJHLl/CftI
         w/14ftLrScRxggPwVNc8z6rvRKzVrztCQh1nz5Qf7Ewwejf9EYzOy5LDB5WcfJR2+ufv
         tm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057886; x=1794662686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VH7ady2HZ4+2o2AB4BRmr/CzSYqljeaOTtIyqJxzjb8=;
        b=mxOYJ3B6mfy8zSuK2xUz8RMbvNj5i2zgsoe/j1w1ewTu4b86oCzdxYAtf7xP1l2GOa
         ZYV/G0f9TwMbo5z/a7aWk2BfpaXdyluoFhX5YxG4uBWS8JKTYPoXkhJKvI4sAlm768Gc
         xuX5xLsLUi3VsUnxDEt803Ap8n3xxJtr+ZEDxOuY8jOrwsUcV/AJkn3j1raci0tFNxKC
         Sr+ABGqlmXVclnT6YGdcxsqPiUjYrnwB+P1JIE0Ubds/2LL/8CVrTOiq/QHBFKCOjixd
         cd6vra1teZj03BXCs4hKFzzbP0c9ay9zVfNr/4CsbSM3UmCEV8/57ZnvhjZB96zoUmvD
         Nosw==
X-Gm-Message-State: APuU4Z80wCTSj0ioiKIE3HY1parAStvSChZq63Wh41Pt0GgyCu0hvo8Q
	ZRXM+uNxbSIT7yaVUMlx/fh+pFSp6VkoN00jlOjiZyIDasicoHlol/xfYhsgg4BNS+Drrg==
X-Gm-Gg: AYBFou21wczEUrC6M1LIMM05s7738I8upPMow0lYIi+VgVmO4pKL7aer5PT93/YyGR5
	oOD9Xiaez5bYdaHxq2Akxj/4n0ZL5qahsT75WS6H4eSaoayhwyjQ66pwABSg758rKA2DI7pUPL8
	7v4b/B5iGy8TXZy6pQ7UKmdBilbxkbl2ipM8TOHhH+eDTrPFpGn0oBK303BTeg+gF6KryO3kyUn
	7ej1aVn7dFh4UDMCIL1x3zgQiL7Wfa1Mz4owr7NkXwrbB/D+tBwCyBuRLFi/De1joVk02zoxv4l
	r+dXcbr7ku1vZ9vhcyaxsVnNow4SEUqyk7OJ7IM3ADdpMBvXzf3aqCq/lgQXoP365SXDEvq4sI9
	NIFxW3iO6cbq3nLpofR7ER4p+TBZkVHgORXrwfNr3xC1zGAzsYTEvVv2cu1baen0dYfl/JQlK1Q
	Et2J0I3Dazap+cr6qB7cupr7ZtyYJYx34wAGkPiI3vt9fuD8yjQKww5D2QX6mQ501MIoKcha5Hx
	A9a9pjhBl4mlcJVacfmHgvOvE7XK/lJaj0OcpvzYE5YpqZTr6vfKuTxjOBrQTtzxkxeThRmMKCA
	clMMYnxcAbkJGKys4Fn8kO3XnewG8/iaYMIw08crgnxRiJ5wnRz/GxU=
X-Received: by 2002:a17:90b:4a06:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3b106314922mr1376177a91.24.1794057885649;
        Sat, 07 Nov 2026 05:24:45 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a0475sm3386135a91.0.2026.11.07.05.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:24:45 -0800 (PST)
Date: Sat, 7 Nov 2026 21:24:40 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf v3 1/2] bpf: reject incompatible socket assignments
Message-ID: <h6fnquoculybbdb4ygf7bznp4ou2jhtctiw6dkezvngozrbcps@zivgduwdvwr5>
References: <20260930164020.41006-1-shlomojune6@gmail.com>
 <20260930165415.85C361F00898@smtp.kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930165415.85C361F00898@smtp.kernel.org>

On Wed, Sep 30, 2026 at 04:54:15PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] bpf: bpf_sk_assign bypasses family check for encapsulated packets
> --
> 
> commit bd75dbe60b27d785e5799901fce33eb038028e20
> Author: Shihuang Liu <shlomojune6@gmail.com>
> 
> bpf: reject incompatible socket assignments
> 
> This commit fixes an out-of-bounds stack buffer copy by validating socket
> and packet family compatibility in bpf_sk_assign(). It ensures IPv4/IPv6
> socket mappings match the packet protocol, maintaining compatibility for
> dual-stack and mapped sockets.
> 
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 70dc621672f2e..173349bd2a3f9 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> 
> [ ... ]
> 
> > @@ -3491,6 +3491,64 @@ static int bpf_skb_proto_xlat(struct sk_buff *skb, __be16 to_proto)
> >  	return -ENOTSUPP;
> >  }
> >  
> > +static bool bpf_sk_assign_family_ok_proto(const struct sock *sk, __be16 proto)
> > +{
> > +	const struct inet_connection_sock_af_ops *af_ops;
> > +	unsigned short family;
> > +
> > +	switch (proto) {
> > +	case htons(ETH_P_IP):
> > +		family = AF_INET;
> > +		break;
> > +	case htons(ETH_P_IPV6):
> > +		family = AF_INET6;
> > +		break;
> > +	default:
> > +		return true;
> 
> [Severity: High]
> Does this default case bypass the family check for encapsulated packets?
> 
The default is intentional. 

Rejecting unknown ethertypes would just break existing programs without actually fixing anything.
> If a TC ingress BPF program uses bpf_sk_assign() on an encapsulated packet
> (such as MPLS), the switch statement falls through to the default case
> and unconditionally returns true because protocols like ETH_P_MPLS_UC are
> unrecognized.
> 
> If this packet is later decapsulated (e.g., via the TC act_mpls module), its
> protocol could change to IPv6 while retaining an assigned AF_INET socket. When
> the networking stack processes this decapsulated IPv6 packet with the AF_INET
> socket, it may interpret the IPv6 control block data as IPv4 metadata,
> leading to an out-of-bounds stack access.
> 
> Can this be triggered remotely by sending encapsulated packets, defeating the
> vulnerability fix for setups performing decapsulation?
> 
> > +	}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260930164020.41006-1-shlomojune6@gmail.com?part=1
