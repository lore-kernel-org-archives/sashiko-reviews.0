Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE72F387598
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128010; cv=none; b=MuptKx+hJVi1DgPZPuSS8l6IvXJ4xe1JS+ZIF5drX2cneNlZ3nQu/yCO3b11JLUJkN/+Nbrbi/gPLNC2eoFu8mFur3gzBHztAqgngEqsGjWvtcmIkkzGxpQYgXxw163wzN/X/OfRBlrlxjhoaGnzlXvIykyqvBnITApHiCxEsoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128010; c=relaxed/simple;
	bh=LvaFAT8Tk8IvuNbiwwUuWT3PICxar58xbElnDqoyo+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABzcHHUcukHA4sGHG0rfZUshW6NK+5MMb52y1cohJa9ty7b2EL57TRUD9JYeSb9vHUFFxrcdh3ak9Sxc6B+aaPvW2kLbFPpKmcii7RcPT6gDHBNwbZUuB4eWd6HSmmSy9z1trZg1Lky/PFrqNhU305TWh3me1ASDr24v0584Loo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJW7qD5D; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJW7qD5D"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48d102471a4so21474915e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 11:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128007; x=1779732807; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2SkNQZ1eRpX72UK8FcYhuc5kIn0Q9OYKn5Iz6nc7pug=;
        b=IJW7qD5DqKiR/XYQCDspn69g3qmDa+7oGqvIFchbQ2oDT+vZvlMFaJIxj8yeRQUFJG
         kWUOTwo9nro7CX4rh0Ba7DvNjr5k0tp7W7WtirLSmHOsrDBemVs0ERFKbg5cHWtOcpzR
         mf556roXROHWYDqW+x+NMwGnohWywLqzUPPTWVV5M9gaUtm3sADx8JtweLEnEduHcM8I
         agLfr7wiVs1ci4SjS54dCPZ5eYcUmA3B0ozb6IN857qZU0IpmZ6KQ54II6bhtptiho/k
         vvD9N5tjAqtF/PBWhTJxuCIJ7SQmWJtsIOTYJyvPAmNTLqnV3DQhBRchYo5i6sxtVugH
         qJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128007; x=1779732807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SkNQZ1eRpX72UK8FcYhuc5kIn0Q9OYKn5Iz6nc7pug=;
        b=NkvS4P1QHnqtEVk55hEjOZtiM5umXWkoCIJ30PRGxz5Cua0FklR7bKg/ODoxRSsrk4
         53d3jQ+a2xztnr+qYS/loNFtDF3MQMAxpV+yZTO/NjlRTRhNH4HW8x4G3AZSdKNB7Xdl
         hvENICSBXlTZ01xw9XZ9VU+xAOeG/CErrHa3HPES/BjFdnWt4EJlB6afJbzMO6qy1OAs
         YneSJgV/tNEb2rAAY+3zRqFdd2rVCEjvYKl3eBWuF1P1n2iOaajHbV6RuLDsaeN21CU1
         goU2BZ6hNl0hCc2fpC/Z9/lEXb75FZo2E2Fa89KJpDsmbMoREfhzTdjcUMJ3UHg2PyrR
         w3ww==
X-Gm-Message-State: AOJu0YyzdntBgflswyw76sj/kFvwBfghj5gXCzdIObvjICGVAeWwYJ3M
	LOCfmwLvF7X2ZPHOP4nZSyrgzzi9/VRIpaBFD3xbjiZEyyv6/8WyrnRueL6p/eSqCFyTBC9M
X-Gm-Gg: Acq92OHNJ2GPdVKkeh5dp69TDNbZ8mhaQcdMav8aOkgYbZL5b1VjZhgFhwKM4U6ZKVc
	korL/3uVoZMAYYniOoJMrABUI6b/E+J/WHS3d8msuPcqIY1u1OmKgg51QWXUg6k3ExYq2Km90yq
	weRJg7V8ytMNmsbSl7gVS1/Lu1XtkciZKiuu7dx2lLD5TkRVFnFV51ZJoV5t9A7RAPS6sKvHL66
	jQ2KJzfKhhyM6BzXaSUPGkEnBtlR0byWVoj3K3CXr4qlVfzFEAcoTQ8G4Bj4+heJ+gAHjluk/jO
	8ZF80piP1DjFhvcUZy2UwyXXruNv2hOWc9vrR/kbo1uRTfh72Fd2R04YBI89hO8JpHUD5sJssjE
	fHSCepUx90ItHER5SFg/mr9dib8369O68yTpvH0HY9D+/ue0JbnL3+3nLyfawEI7lEUBGaeUJqv
	AMXEXfIYz2TkS2zYgn6ecYdcRIZnafyGTZfKBGR9Jl5JA8zKaxXUVa13IT5iydLp+S+Q==
X-Received: by 2002:a05:600c:1e24:b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-48fe63182a2mr254168315e9.26.1779128007125;
        Mon, 18 May 2026 11:13:27 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm250953405e9.5.2026.05.18.11.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:13:26 -0700 (PDT)
Date: Mon, 18 May 2026 20:13:25 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v6 5/6] selftests/bpf: add bpf_icmp_send kfunc
 IPv6 tests
Message-ID: <agtWxQedLwq1X-Rq@gmail.com>
References: <20260518122842.218522-6-mahe.tardy@gmail.com>
 <20260518164538.21D3BC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518164538.21D3BC2BCB7@smtp.kernel.org>

On Mon, May 18, 2026 at 04:45:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Buffer truncation and type mismatch when calling getsockname() for IPv6 sockets.
> --
> 
> commit 324aeb5b326896da717647e51a1e69a4c3e6f647
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> selftests/bpf: add bpf_icmp_send kfunc IPv6 tests
> 
> This commit extends the existing ICMP send tests with IPv6 support.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > --- a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > @@ -81,14 +95,13 @@ static void read_icmp_errqueue(int sockfd, int expected_code)
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
> >  	if (getsockname(srv_fd, (struct sockaddr *)&addr, &len)) {
> >  		close(srv_fd);
> >  		return;
> >  	}
> >  	skel->bss->server_port = ntohs(addr.sin_port);
> 
> Since start_server() can now return an IPv6 socket, does getsockname() truncate
> the 28-byte IPv6 address data into the 16-byte sockaddr_in structure here?
> 
> Should addr be updated to a struct sockaddr_storage to safely handle both
> address families, along with a cast to read the port properly?

Duplicate bot review, do we care for reading the port? I don't think

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260518122842.218522-1-mahe.tardy@gmail.com?part=5
