Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F7347536
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101387; cv=none; b=evToWPdVDQdBNJU8uaIiwDSD/dxkiZkAbGbfWhLkYZfk8gmjVREswAq5sd1WjsLV56rEXcGJM6eiFSoKxUtlzLwdCwhV3squGwTHXMBIIC5PSLUQhFCWbfI5ue0adZHIzRFHmgdoRjlGlaDMrT3WGmkXnOXFO/TePqkfyJWmmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101387; c=relaxed/simple;
	bh=+eFASHBUKj/vmGIDzXzaILBDEJbb+2jzsRnnlxOyuDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/N1YL/MP+U3JmhyXSIKlSTycAKfdamu/7QmScxSG4Sd2k1WwQc1bz/a+mFgsrszZN/1PhS/ysmveAANbK0zY7Vb/RoV9D/srZyDRXDq4nuDeN8DrBV6Wf8PVsvZRaBrLdDQYzG3FlykCXDpHCZvIBPJQcR5wGtxIqHOGn8lfRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnfWES6K; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnfWES6K"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48e82c23840so15378625e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 03:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101377; x=1779706177; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmztjgxnBwyFFAmNOF4gqLXbhTNy4nJS+u1BNslkG4U=;
        b=QnfWES6K4PaX/0e2L59LYmT4T3UirOXhVVMlHLElCDBlYv5/8ebIi5xGD90YqlZ7Hh
         yCWbM0dlHO1Z6e7wscEMqft5VTeryvPrhGN3HcezkzsrEOGZUZ8JcDk70LmetCt/hZ/6
         EEX4tneQDyJfLPgQtrjJsyDV9u0uJgi59fecqbTe3PFg+kWavX0nPdVEDxRzi0UylMf8
         o+2RXDyXszf021PP3u/RtIQLLJqJmKtfKze0TAIjBK7vqi6MkClqgkBOylBkBgYknT/D
         hdmeUxn07PBLMcDX8B45hkICKccGTk0UqM8k1SCPEaXL2Kli7m+FOR7kLAQsM1NpudaC
         S6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101377; x=1779706177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmztjgxnBwyFFAmNOF4gqLXbhTNy4nJS+u1BNslkG4U=;
        b=AkVah0DSTnITCISE3eZB2/iP4OY8zJYMtX114LhKHShF927qrHQuKzOoMHvNT2oryk
         2NoqTMaFt29li5KDMDgDXOT0cPsP7wkVBFU76BagLNLPjV95x6xJstJWsauSdmIvFK6q
         qiNIUP/57xJ9OpJrwHlr6oOiCukCDCxByiVtJx5N3v/NVhKc4nBeGfLEXE97bD7aoX4d
         IulV4vBf6z9rXoimbhFCf26Xj94MMxya04dPgj/CVrGA6BDUDGwaDMm+/Niir18M/X9X
         RnA0wbHPbLaQDQmTexY35Cf02vssg40R8fRW2fO7tBC9g/kn8VHI1n33cM/qe9Ga+hXW
         yJog==
X-Gm-Message-State: AOJu0YxeGN/YqqHMxoIAInl5J/MagfwmWPe4t+LDnCc5It70sO/0CGw2
	t98QQxXlNajgoV/yOviQBDBn7JYBz04fkBMLjXH9FkGqRPGWK2sRZYMhYXTB9nWE
X-Gm-Gg: Acq92OGey8//UGmnFuoF/prckk7mVvzeqrJ8OgKuuSh9oYWdR6iuTnpruI2m4n+zIPL
	9jwS3TjEKkLNqeUnFCwLNeVPNVHXKXrhI2vzzpep/+YDwEcqzgxRfc2mVuMhLZv64ycFaB6vFZ3
	JQrDGxDd4RjQ6LeqNNBgomU51r4frX+52IOKapUQPfC9GeaianJTU03xbZNsMLFINdes3Hzn2Mz
	RnVANxiN0XIJ2gLQzzrxC5D+6yCJ62y3A80oKLvi45FewBEl+GXQ8OXE2eGyZmRQXbGG5cMVrv3
	elcT0stdJRWu55xCM7azBj6pivjHngc0cTH+XzvHKaDAYQ1NuEw6jDR5oxkCtUYA1UfWTo1flSP
	wgTHQgu9kbucYCzjZ5x201+CJeEyC9XLQ2vbVDUnQm/MoW+qup4vUVOZ0ZDhMTaxcjTKbI1BN/8
	6qe6Haxp03PZwgpaRuoq7FrLG3ftK4ky4NLy9fBQvmRywovsKW7TWIzxxxra7z
X-Received: by 2002:a05:600d:8448:b0:48f:fb0d:8d86 with SMTP id 5b1f17b1804b1-48ffb0d8ea0mr127495825e9.32.1779101376640;
        Mon, 18 May 2026 03:49:36 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm37534481f8f.29.2026.05.18.03.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:49:36 -0700 (PDT)
Date: Mon, 18 May 2026 12:49:34 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 3/4] selftests/bpf: add bpf_icmp_send kfunc
 IPv6 tests
Message-ID: <agruvp6BaVzUWn8q@gmail.com>
References: <20260515194746.50920-4-mahe.tardy@gmail.com>
 <20260515204444.D8204C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515204444.D8204C2BCB0@smtp.kernel.org>

On Fri, May 15, 2026 at 08:44:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Buffer truncation and type confusion when calling getsockname() for IPv6 sockets.
> --
> 
> commit 3f16e831f177058fc11380fe48e08f94594b83bf
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> selftests/bpf: add bpf_icmp_send kfunc IPv6 tests
> 
> This commit extends the existing bpf_icmp_send kfunc tests with IPv6
> support. It updates the test suite to handle IPv6 connections and
> ICMPv6 error queues.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > index b98c0312adadc..d9badfc6e620c 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> 
> [ ... ]
> 
> > @@ -78,14 +92,13 @@ static void read_icmp_errqueue(int sockfd, int expected_code)
> >  }
> >  
> >  static void trigger_prog_read_icmp_errqueue(struct icmp_send *skel,
> > -					    int code)
> > +					    int code, int af, const char *ip)
> >  {
> >  	int srv_fd = -1, client_fd = -1;
> >  	struct sockaddr_in addr;
> >  	socklen_t len = sizeof(addr);
> >  
> > -	srv_fd = start_server(AF_INET, SOCK_STREAM, "127.0.0.1", 0,
> > -			      TIMEOUT_MS);
> > +	srv_fd = start_server(af, SOCK_STREAM, ip, 0, TIMEOUT_MS);
> >  	if (!ASSERT_GE(srv_fd, 0, "start_server"))
> >  		return;
> >  
> > @@ -94,6 +107,8 @@ static void trigger_prog_read_icmp_errqueue(struct icmp_send *skel,
> >  		return;
> >  	}
> >  	skel->bss->server_port = ntohs(addr.sin_port);
> 
> When af is AF_INET6, start_server() creates an IPv6 socket, but addr
> is hardcoded as struct sockaddr_in which is 16 bytes.
> 
> Does this cause getsockname() to silently truncate the 28-byte
> sockaddr_in6 structure because len is initialized to sizeof(addr)?
> 
> While reading addr.sin_port happens to work because sin_port and sin6_port
> share the same offset, would it be better to use struct sockaddr_storage 
> here (like in connect_to_fd_nonblock() earlier in the file) and extract
> the port conditionally based on the address family to avoid type confusion?

I don't think we really care about this since we are just reading the
sin_port.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515194746.50920-1-mahe.tardy@gmail.com?part=3
