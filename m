Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501597;
	b=tmRvC+FH2bOgj1YdVdn+C8C0eV1iNx1pJcrB3TmW5FuuqdMc+pet7AuXEOl2ES9TWJTA
	 Hi9+UQIa9siZTPgDwjJUbs6kymSN3PoRuTDERFiFUdXFQjhqpE4DaAWFJhAquzdCMLKEK
	 FD6lvZkDfyFdNB1dGfkgQcRuAcOtMU5f7u3ge7Eqfn/sA0uA3x2Y+FHjNbxho0BRufLYJ
	 khSSEGofj4BR0Dje38V4Yvl6wv6/PN9WLA8UPL91i5zHSR6cPK/D92OZMpV5BqBqQRtuv
	 AhLlw9JHJh1VWm+m0OrNV5ukjDLJbSGdZAnUAjKk3SuhgxBzMhnB7J5mL1o/85QjsSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501597;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=mpZM/PApUCXYk+waULQ6V1zgWo4rHEBgYCIeZURGF+E=;
	b=tYgIgmo+SyG6q7GnKT7tSJrxCLsWhs01y3sle38mzBLI32+DakMiK5mB0qDaaok579tF
	 sRJd0bW4KTDbTZcnwkN7EPtZXJEP82TnMsR+aZTo9NZryqZU2URoqzAEIWtUkinRlmre+
	 1zwDSdXcd7275wX8hKKf+BP7P2GP0hLDDETH0p1cl1L3i+LbUoSsylsnaQDgWVztvR7h4
	 /CBlXKCwK70QabPU4i2nlxKV+GH0jkWKQvKjiKnfKemNXLojzrqe+jGft3ldnX4JPUnKm
	 zLqygvoOSrwELidzvIiaeQ3LNZIQ7QApEppURzHhlIF/TPO1mEQSs0DHoVN1k8+GZjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YmGBDj8l;
	arc=none smtp.remote-ip=95.215.58.5
Received: from mta1.migadu.com (out-5.mta1.migadu.com [95.215.58.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8A4606A33D
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 06:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E8A4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YmGBDj8l
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=DGfdq0OFqBVtrTdkcH+vMb5rQtWobPUwx2DZTPEMh9M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795501595; v=1; x=1796106395;
 b=YmGBDj8lInFrOZ8biCXiQ+G4lZAhpA2vel7x0klHTOB8oz98hZw0jNFE+G2DTnwZ6WuGbQKb
 AcrTzTvnlW/iaDc04Epy6bmDZ2T+K2g8vx4SsTlySSpu7bPF3yJShkm0ceMlZGMGChqxZhdo0iq
 OMn/IUNCABo+6tL6TZ+mxXVA=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id bce02c2e5679289a;
	Tue, 24 Nov 2026 06:26:34 +0000
X-Mizu-Trace-ID: bce02c2e5679289a
X-Migadu-Flow: FLOW_OUT
Message-ID: <36c2f179-1bbd-46b8-9d67-f2726f959cf6@linux.dev>
Date: Tue, 24 Nov 2026 14:26:31 +0800
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
Subject: Re: [PATCH bpf-next v3 1/9] bpf: Add log support for tracing
 link_create
To: Jiri Olsa <olsajiri@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <20261123152743.19629-1-leon.hwang@linux.dev>
 <20261123152743.19629-2-leon.hwang@linux.dev>
 <sashiko-outbox-229589@kernel.org> <awS5qgoIeSAheK-w@krava>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <awS5qgoIeSAheK-w@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/26 06:09, Jiri Olsa wrote:
> On Mon, Nov 23, 2026 at 03:38:47PM +0000, sashiko-bot@kernel.org wrote:
[...]
>>>  		tgt_prog = bpf_prog_get(tgt_prog_fd);
>>>  		if (IS_ERR(tgt_prog)) {
>>> +			bpf_log(log, "Invalid tgt_fd.\n");
>>
>> [Severity: Low]
>> As reported by Alexei Starovoitov on v2 [1], should this log "Invalid
>> target_fd.\n" to match the link_create.target_fd UAPI field name used by
>> the other log messages in bpf_tracing_prog_attach()?

Will update it to "target_fd.\n".

> 
> with this fixed, the tracing_multi changes lgtm
> 
> Acked-by: Jiri Olsa <jolsa@kernel.org>

Thanks for your review.

Leon

