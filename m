Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFA1307AF0
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139677; cv=none; b=ura6FPvaf2NizovM7qonSO7FKISs4yi6SOshMhsBX6tlXyK8s8nbDIGGfYvE2K9uQlysqh0eP3kI8dRG0KzqkBu8GKQrFKT3jwdgmfaveWTEnIsKZxOS9oD4YcOPbUgxckggIyCVPsH7LpY2uj+/goUh7Bruu0I/sa0JcfP4RNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139677; c=relaxed/simple;
	bh=zYemPZMdTHCuocq7TlEZHrhgov3DesV7eyqbBwxxwNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lvoflF2RmXP9i40lwehe01SOeOMmVi28cTXVTcv7F8gAlr02gyNMmrbvemegOwFBVTj0mxj+yJGetsdqTeAcBTPgnwVmXPj2hD/0HhA8ZF9quRI+1ig+pn8hFZ3Ly6jvf+9yMdM0/ZT+mOfOZJq8KgoNP5V0N4y0QI2JskLA2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=KWt152kS; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="KWt152kS"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-697cd68d7adso802603a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782139672; x=1782744472; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOx8McGgHCmd0/ew0ozXnnvDEcN08z5gnGYc0YXCEQI=;
        b=KWt152kS1l21HE1lirVVaH1Kgcu9sVrt5UEwD4MBNVKWAUfPdNPhPa5okpsW2NqjGM
         p0aPAqZThCdvFXkCehVIXcn4SaUoZeDSODyAcaC8sEF9mSPeWH+kLyLYgIlCXhm2X+gD
         B7m2q5+OoG+01Qe4FIyUVZbgUlItsvPDn6gCk5P1xyssbUylA6ejYZ9Sabp2Jwm0VzQ0
         tHxJyQjVezGNQVCUrDGzWmTf0y0I0aWja+MWbcTAXMa8xnIbEfrcGergkL/gboz9/MiO
         CET5T3498+LhMR6KKafKsyx/KGAqjTlzVU3pqWoggtj+i89eyfLNdLUh9gD1LHH67ewy
         19tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139672; x=1782744472;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eOx8McGgHCmd0/ew0ozXnnvDEcN08z5gnGYc0YXCEQI=;
        b=b4hB/wr0q3gHqwx2Hs6mzWimvxKYbgJOpppqu5ewuiW0KEor6Igf8gFjb2eijitkF1
         608qh9K2jzcOn3at9fZITuCYWiBdyZ/05jFfUPItYFTuljh2jzY6d6V+XScuT6ioad2A
         oJ24jWPJ5SepuEmSMYOOTYZi49n08CjK9f52Q+QHYUy/qOgJAAmbs9GMeT4lu1rXP8JZ
         mvsSbrMVjUmrilMfi+n2ez9e30rE/AP3o7NzPSrSsGiqias0WVNy9XE//cJ8RiNMrcHV
         j9IVqpWP//JOblRDKrYNznbeKCH87oJBrAAJCGEPkPC8jec5sT5KUzDqlE7twaguqdsx
         WwHA==
X-Gm-Message-State: AOJu0Yy1jrPx5EUruZXVErBTjOm+ApWlixC0oIm7GrCeXy4PYYpxcZM2
	PNlkQoHY0Wovos+0UathoicvwPkcUMyJB31T190eNFvagbQK2PuULnLiaHGDju9VVb0=
X-Gm-Gg: AfdE7clD1UOn7QTHtrv1F/P9twITlFoi1jY+Gip45QSQ3hHMWHGF7L3BeBtB6vLnKps
	ARphDWQOa5hYYxm9Wr9z7Y9eYhp4BvY8EPtDn6jq+2/MNubqwi4grrIvDxGk489c2EQ8of75gKD
	GVbDS3wcqxJxD5MVXlhb/kJ0UGGnyhb6Hkt+5VH2EzqxdXRam2+M46M76AiS4PFpe4edwM2v/Mp
	clk1VMf7X4yzCTYgp2B0mKVXfbctvvsRHk/cd2NTWzSi6ufUkcKxIkIbYA/0h3TJWuFSr8K+0+u
	ATzwszuz4nCL9h+qeNWwGCEAs1d7j7k4Rpph6NBbk3vdxAp4IvrP07c38kkKeH8U0zVj5HEiMSL
	9RhTjY50BwATPzR7tHNnYycEgOy42vU294ro7eKOAlH78qO8rXOMD63/blNcEdwU4HqgVSfMfka
	TECgA/uLJdNq0fsEFvDVyMRcrd0A==
X-Received: by 2002:a05:6402:4307:b0:697:849f:7dd1 with SMTP id 4fb4d7f45d1cf-697849f8021mr3567477a12.5.1782139671680;
        Mon, 22 Jun 2026 07:47:51 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm3513391a12.3.2026.06.22.07.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:47:51 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] bpf, unix: Guard sk_msg-dependent code behind
 CONFIG_NET_SOCK_MSG
In-Reply-To: <20260622131731.E619F1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 22 Jun 2026 13:17:31
	+0000")
References: <20260622-bpf-sk_msg-split-unix-v1-1-d7e0cb7bb03b@cloudflare.com>
	<20260622131731.E619F1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 22 Jun 2026 16:47:50 +0200
Message-ID: <87ldc64oo9.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 22, 2026 at 01:17 PM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Calling recvmsg() on a UNIX socket added to a BPF sockmap causes a NULL pointer dereference when CONFIG_NET_SOCK_MSG is disabled.
> --
>
> commit 95825431b208bd3fb6f5fe58d504bdcb560273c9
> Author: Jakub Sitnicki <jakub@cloudflare.com>
>
> bpf, unix: Guard sk_msg-dependent code behind CONFIG_NET_SOCK_MSG
>
> This commit conditionally compiles the assignment of recvmsg and 
> sock_is_readable in AF_UNIX BPF protocol rebuilding functions, guarding them
> behind CONFIG_NET_SOCK_MSG.
>
>> diff --git a/net/unix/unix_bpf.c b/net/unix/unix_bpf.c
>> index f86ff19e9764d..5289a04b4993f 100644
>> --- a/net/unix/unix_bpf.c
>> +++ b/net/unix/unix_bpf.c
>
> [ ... ]
>
>> @@ -107,8 +109,10 @@ static void unix_dgram_bpf_rebuild_protos(struct proto *prot, const struct proto
>>  {
>>  	*prot        = *base;
>>  	prot->close  = sock_map_close;
>> +#ifdef CONFIG_NET_SOCK_MSG
>>  	prot->recvmsg = unix_bpf_recvmsg;
>>  	prot->sock_is_readable = sk_msg_is_readable;
>> +#endif
>>  }
>
> [Severity: Critical]
> If CONFIG_NET_SOCK_MSG is disabled but CONFIG_BPF_SYSCALL is enabled,
> doesn't this leave prot->recvmsg as NULL?
>
> When a UNIX datagram socket is added to a sockmap, its protocol is updated to
> the rebuilt BPF protocol. If a user then calls recvmsg(), unix_dgram_recvmsg
> checks if the protocol has been overridden:
>
> net/unix/af_unix.c:unix_dgram_recvmsg() {
> 	...
> 	if (prot != &unix_dgram_proto)
> 		return prot->recvmsg(sk, msg, size, flags);
> 	...
> }
>
> Will this cause a NULL pointer dereference since prot->recvmsg is never
> assigned for the rebuilt protocol when CONFIG_NET_SOCK_MSG is disabled?

Right, my bad. I will switch the check to `prot->recvmsg != NULL` since
unix_{dgram,stream}_proto don't set it.
