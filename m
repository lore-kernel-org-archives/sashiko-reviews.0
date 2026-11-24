Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502680;
	b=eAYv+6BXJAL/t5N7v19H/9aolpBEU8+YyB88DlUCb0Hbg09Ai6IFg8SlYIF5xtye5vIh
	 VD/Tuk0ewg6KYoXioCIRpenjoubEyLYpT+6k1GCS8NHaiXsoMJuu2SiA+TTRm2imCj/wb
	 LN2cX5ck3HUY5psvUIIpmb1G18Q0xJr6iFv6lJ6mIfvH8VsMSs+d79oJ6X6y8fplgV5kx
	 meop+B9qh4wPZNIzTUB/YSU8F1t6doI3efs+SRbeNDFnDPTh4HOdAMk7h30epZfJ0PSvN
	 YCJjzqIXGvFYz6Z+GEx4nw0qVBRdDUGSN8jwi9luY6LfRpktrDv5Uzwl5rZph1oA0/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502680;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZxZjeyzDUCPuBziPwBQouparBL6NVZFSLDryV/eFVHM=;
	b=2cXEaA3mtLon072u4Ccbu+DV6+LknVeQTh+N+pgU/e7MoF2DGwhbR95t6EfL+AFHMO+c
	 +DZ6MC+0ZcKreJRw7O11pN25WsEJQa/iqFYiqHwM3Q7O/Wyx+U+2A+Qi3UPq6cXEN43KC
	 X2gw3YngvrzC/5uP5nkoXN3tC3XkKvUNWqAs7HVRXviQg8qagHYfGaJfpqWKCfKNKWmAs
	 twz0xKlf5XgA7ndVw5xBqWxeCSRFoKUZhX5WEwLSc6l9GIbnveRflEpcliiv/viLXEN4+
	 7K9qmO/+PJ4ffsQsnlF3JNhZctNFST3zlx+fOWdGSQhKC+uYztmSdxsnVy/knJRIKLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KVgylERz;
	arc=none smtp.remote-ip=95.215.58.4
Received: from mta1.migadu.com (out-4.mta1.migadu.com [95.215.58.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08942606A327
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 06:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08942606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KVgylERz
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=eL5pZ5rp2p7r1Xu8Bzzhclg/JXgXV6fM1d0JqyHaPHM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795502676; v=1; x=1796107476;
 b=KVgylERzDG5J/KRgFgoeC4RgoGP9RyLDZ66Gsnr6+dggU5SL/l/eDSerZJV2aSed7ql4gG6E
 94cg5dajjRBOVFJixh0nNdRKkmWcdKRxlVu2Gq0GeSyP7xEa6qAIESpKVxZbPHfENwrW7KGGIRO
 DToxAYPlae60rkVCex5EWb8Q=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 865bb19f8eb4368b;
	Tue, 24 Nov 2026 06:44:36 +0000
X-Mizu-Trace-ID: 865bb19f8eb4368b
X-Migadu-Flow: FLOW_OUT
Message-ID: <e5a6139e-814d-4aca-bf44-58871af549a5@linux.dev>
Date: Tue, 24 Nov 2026 14:44:30 +0800
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
Subject: Re: [PATCH bpf 1/2] bpf, lsm: fix bpf_setsockopt() on a half set up
 child in inet_csk_clone
To: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, matt@bobrowski.net,
 KP Singh <kpsingh@kernel.org>
References: <20261124061544.254586-1-jiayuan.chen@linux.dev>
 <sashiko-outbox-230603@kernel.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <sashiko-outbox-230603@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/26 2:34 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] bpf: NULL deref in bpf_sk_clone_setsockopt() via MPTCP
>   subflow_write_space()
> - [Medium] bpf: unnecessary rejection of IPV6_AUTOFLOWLABEL in
>   bpf_sk_clone_setsockopt()
> - [Low] bpf: multi-line comment style violation in bpf_lsm.c and
>   filter.c
> --
> 
> commit 9470b8f4e13b2c8be2cf5cc10f852d869dbb6f7c
> Author: Jiayuan Chen <jiayuan.chen@linux.dev>
> 
> bpf, lsm: fix bpf_setsockopt() on a half set up child in inet_csk_clone
> 
> This commit introduces a dedicated bpf_setsockopt() helper for the
> bpf_lsm_inet_csk_clone hook that rejects socket options unsafe to set on
> a partially initialized cloned child socket.
> 
>> diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
>> index ae23511fd811b..fa71f52a055c5 100644
>> --- a/kernel/bpf/bpf_lsm.c
>> +++ b/kernel/bpf/bpf_lsm.c
>> @@ -79,6 +79,15 @@ BTF_ID(func, bpf_lsm_inet_conn_established)
>>  #endif
>>  BTF_SET_END(bpf_lsm_locked_sockopt_hooks)
>>  
>> +/* List of LSM hooks that trigger on a locked child socket which is not
>> + * set up yet, bpf_setsockopt is restricted there.
>> + */
> 
> [Severity: Low]
> This isn't a bug, but BPF multi-line comments place the opening /* on
> its own line (here and above bpf_sk_clone_setsockopt() in
> net/core/filter.c).
> 
> [ ... ]
> 
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 53c042b267ab6..77abc4cb9db51 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -5938,6 +5938,43 @@ const struct bpf_func_proto bpf_sk_setsockopt_proto = {
>>  	.arg5_type	= ARG_MEM_SIZE,
>>  };
>>  
>> +/* security_inet_csk_clone() runs at the end of inet_csk_clone_lock(), the
>> + * child is locked but not set up yet: its timers are not initialized, it
>> + * holds no reference on icsk_ca_ops and an IPv6 child still points to the
>> + * ipv6_pinfo of the listener.
>> + */
>> +BPF_CALL_5(bpf_sk_clone_setsockopt, struct sock *, sk, int, level,
>> +	   int, optname, char *, optval, int, optlen)
>> +{
>> +	switch (level) {
>> +	case SOL_SOCKET:
>> +		if (optname == SO_KEEPALIVE)
>> +			return -EOPNOTSUPP;
>> +		break;
>> +	case SOL_TCP:
>> +		if (optname == TCP_KEEPIDLE || optname == TCP_CONGESTION)
>> +			return -EOPNOTSUPP;
>> +		break;
> 
> [Severity: High]
> Should bpf_sk_clone_setsockopt() also reject SO_SNDBUF and
> TCP_NOTSENT_LOWAT?
> 
> When an incoming MPTCP subflow is cloned in inet_csk_clone_lock(),
> inet_clone_ulp() -> subflow_ulp_clone() allocates a new
> mptcp_subflow_context with new_ctx->conn still NULL while newsk inherits
> sk_write_space = subflow_write_space (new_ctx->conn is only populated
> later in subflow_syn_recv_sock()).  Both SO_SNDBUF in sk_setsockopt()
> and TCP_NOTSENT_LOWAT in do_tcp_setsockopt() invoke
> sk->sk_write_space(sk):
> 
> net/mptcp/subflow.c:subflow_write_space() {
> 	struct sock *sk = mptcp_subflow_ctx(ssk)->conn;
> 
> 	mptcp_propagate_sndbuf(sk, ssk);
> 	mptcp_write_space(sk);
> }
> 
> Passing sk == NULL into mptcp_write_space() ->
> mptcp_stream_memory_free() causes a NULL pointer dereference.



It's true.

I can add these two. But I am not sure the list will ever be
complete, the child is only half set up at this point and each option
needs a look. Or we just don't allow bpf_setsockopt() in this hook at
all?

> 
>> +	case SOL_IPV6:
>> +		if (optname == IPV6_TCLASS || optname == IPV6_AUTOFLOWLABEL)
>> +			return -EOPNOTSUPP;
>> +		break;
> 
> [Severity: Medium]
> Does IPV6_AUTOFLOWLABEL need to be rejected here?
> 
> Since commit 5121516b0c47 ("ipv6: lockless IPV6_AUTOFLOWLABEL
> implementation"), do_ipv6_setsockopt() handles IPV6_AUTOFLOWLABEL via
> inet6_assign_bit(AUTOFLOWLABEL, sk, valbool) and
> inet6_set_bit(AUTOFLOWLABEL_SET, sk), which modify
> inet_sk(sk)->inet_flags on the child socket rather than the listener's
> ipv6_pinfo.
> 

