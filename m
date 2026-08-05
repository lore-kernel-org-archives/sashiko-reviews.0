Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A2948988B
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918147; cv=none; b=eXIt/SeMQWlyUwZbEV2X4a3DZbtb0IRerHKXnl4LUUwZT7Zs3Nhti0Pzoqkk1MIgRVUegOMZRri6LN9Xana84XPF43kTZwKvYZrMS+2Ef4fUj5kGSubwXlCdSjJPJ2ZqeLKFmd2YZ5ZRysm4uH6UdKyBLohi8PK2L6dcLHERm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918147; c=relaxed/simple;
	bh=QHYfGuMolQ8A3YO3Jr6H088OtOknOcMyY41/gK6OrmU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNYVJrlJNKT/pa/S3knfB3zz6h/lQ7ZSqDrlK17d+SZffy/FFTt7UaExOBQGrVIiqyoM3qNzu5D4pXwWwX9BXvkT/iGQdqxxOo4OPsVLUYrqWwuNHQrnk1Za5GKfSYRtb7Ejyhm393zlMBWdEL7Ea//3zBMMDZ4ZIbF9XoYaxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da+qPf5i; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da+qPf5i"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f7872abb6so325702f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 01:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785918144; x=1786522944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTnN+TvzBg4AjKqbGE7dFy9XV+JzEvnALTtq5MKiwe4=;
        b=da+qPf5iHlPSkqgtJaKLKUkwyd7xFw/t3rUqpDAee4pjez1j373cY4hC6O29uppQ5j
         jwH6vOSxcSrhWc1f7bxMMBUftL7+uVEoE5yfQ83UmNPOkcJjon0VkC8u/EcsyCsJ5ibJ
         CV+WEu6rs4g5t81TMwoVWK7M0RDQygJLah2HWenaqlj07vtE23TBtmkzfzX1KEbE+v4Y
         JZYJrMrRWvNANIFv4SaDtub/Xb5V3aXpbPB9KZfZ03gsuaqLg+OeONi/yY+BM7X3/LlL
         FxJ6WelJjX5fVdCTSr3NqDajggBje0ex5XflW5j04STUkqqf1Vp+FmTW1DI5h2opkzez
         Btkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918144; x=1786522944;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTnN+TvzBg4AjKqbGE7dFy9XV+JzEvnALTtq5MKiwe4=;
        b=Ve3FeOdEwcCVMrfqH5e20bsI3nO4sEhuWai7JZ0NQeJDny08KNotDrWjQHD0rIAsVP
         Xd7cxRuP6IsvLMk8tgzmkXdsB50lWortvVHFrYFtQHirZOdv8rt39bIrjzLXK6pUA5wy
         mGybu5Wf94NxedvliZG5uP8Wk0uOFYivQ94o3/Irg4ff0ROv4irZOfn/0sV7ARTun3On
         7nTlLLa1ho3NsW2yoql+XVG3vmfRnIzIEqgGAVzexmP7jlLxvi7fSdq6JXy+d1KAADNw
         mxJ1qxXF25BeGJCBhgsxRP9BBP7CHYBPoMHhk282b0kOPlHkwobd8rh/ru4eapwjNh8K
         D3Fg==
X-Forwarded-Encrypted: i=1; AHgh+Rps+KC1CgXSMkkiCfiFRW7PDoBaQ+fSzRf3NLtOM6NsKOYeA4PjqUBs4jIFPm2Ic7nbCQtRF3uCgs7hcBV4MJ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyclGOT9ZbSbuISTloviUQR50r70fDysq+iWYy3YZStQdCAyLkr
	+NG5Muimq7UmJ56K2b2OdlLU+RgvHkWGLDCelFzHSY2jx5b5jD6t1vho
X-Gm-Gg: AR+sD13sMZL6sEkI3slGvc7jEQiErZdcaFEp5m+SdijAqW9JqnLmunCFpglaNLs6x8g
	Mfk8H5lkoqFSPeee04Exp9hrSg2KUGIYymbqEzvx9Km9fLI3bqqi1OmWqUBtGbqHO1nkZW+RXJr
	DcGL5pgYdLT/PEoIx3QhpqDZHr1JVc1bXec5iqTmGXmF2EBHGmXqMnK0IQHzDMlb+eSwSJyTFab
	1W0gMkrYUOE/gZwT+gf9xg5HIxtxHUPenzj4IPpr6cI71apSk9YI7qxdUQ8fBCzVp/siDJWcZsK
	k0NVorRLHQq7j173KsxPRnAsoUBUQW0/OnOLdlIT8Usi5dgBkIcfneoxSpT7ylcGj0Ld5H1OiJS
	TRJne86ZGYU7nWyAwU+yi6zb1x0JxyVqrwAAr14yqeN4qJ7i5Lxwqh56pfMwkWoLtWvTK0J9jvo
	BapW6fsECYgtMi6UuGx3h5VnAPuT8iJbXi4zJmarboz05Uj5sdUPEgIWsdvq61ejs/C00e5S+LK
	W5dIyLi7fXYt7+H8jsc1t0u5DOpsF1y9BeMHuyXYH4IRQ6FYTGV
X-Received: by 2002:a05:6000:382:b0:476:7036:f854 with SMTP id ffacd0b85a97d-47fec52a21amr8100866f8f.21.1785918143400;
        Wed, 05 Aug 2026 01:22:23 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfe5d7csm7233885f8f.15.2026.08.05.01.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:22:22 -0700 (PDT)
Date: Wed, 5 Aug 2026 09:22:20 +0100
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: bpf@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jakub@cloudflare.com, jiayuan.chen@linux.dev, 
	john.fastabend@gmail.com, kuba@kernel.org, kuniyu@google.com, ncardwell@google.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, sashiko-reviews@lists.linux.dev, 
	linux-kernel@vger.kernel.org, emil@etsalapatis.com
Subject: Re: [PATCH v7 0/2] bpf, sockmap: handle spurious tcp_msg_wait_data()
 wakeup
Message-ID: <anLyIzAs9JBhZnhe@localhost.localdomain>
References: <20260721223807.75101-1-nnamdio@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721223807.75101-1-nnamdio@gmail.com>

On Tue, Jul 21, 2026 at 11:38:05PM +0100, Nnamdi Onyeyiri wrote:
> Spurious wakeups in tcp_msg_wait_data() aren't being handled by
> tcp_bpf_recvmsg() and tcp_bpf_recvmsg_parser(), leading to unexpected
> EAGAIN errors returned by recvfrom()/recv().  Adding handling for the
> wakeup and a selftest.
> 
> This issue was first discovered in an application that adds sockets to
> a sockmap as a way to view the received data.  No redirects or any
> other operations are performed.
> 
> Sashiko has noted a few other pre-existing issues in the same area
> (https://patch.msgid.link/20260714205118.17DB11F000E9@smtp.kernel.org)
> that can lead to EAGAIN in tcp_bpf_recvmsg() and
> tcp_bpf_recvmsg_parser().  A local run of Sashiko also identified a
> potential issue in tcp_bpf_recvmsg() handling zero-data FIN packets when
> the MSG_PEEK flag is set.  To prevent this patchset from growing too
> large, I intend to submit follow up patches to address these once this
> one has been accepted.
> 
> Changes in v7:
> - In tcp_bpf_recvmsg check for data in the TCP_CLOSE, !timeo and
>   signal_pending branches.
> - Refactored changes to tcp_bpf_recvmsg to reduce duplication.
> - Increase the number of iterations in the selftests.
> - Documented selftests numeric constants.
> - Link to v6: https://patch.msgid.link/20260720171535.67867-1-nnamdio@gmail.com
> 
> Changes in v6:
> - Closing the file descriptor in the selftest worker thread.
> - Ensuring the selftest loop breaks early for an error in the worker
>   thread.
> - Added comments to selftest regarding focus on EAGAIN error.
> - Updated selftest commit message to imperative mood.
> - Link to v5: https://patch.msgid.link/20260717155348.54975-1-nnamdio@gmail.com
> 
> Changes in v5:
> - Move selftest from net into bpf/prog_tests/sockmap_basic.c
> - Link to v4: https://patch.msgid.link/20260715213538.37229-1-nnamdio@gmail.com
> 
> Changes in v4:
> - Fix potential data loss in tcp_bpf_recvmsg() when a FIN or RST has
>   been received.
> - Check the return code of pthread_create() in the selftest.
> - Fix race caused by using EXPECT macros in a thread in selftest.
> - Link to v3: https://patch.msgid.link/20260714203927.32289-1-nnamdio@gmail.com
> 
> Changes in v3:
> - Added the sockmap_recvfrom selftest.
> - Link to v2: https://patch.msgid.link/alFRK66z45eDNZA7@localhost.localdomain
> 
> Changes in v2:
> - In tcp_bpf_recvmsg, handle signals and the socket closing in the loop.
> - Fix spurious wakeups when SO_RCVTIMEO has been set on the socket.
> - Link to v1: https://patch.msgid.link/ak_rR-Skd8Mvn4mH@localhost.localdomain
> 
> Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
> ---
> Nnamdi Onyeyiri (2):
>   bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
>   selftests/bpf: add sockmap recvfrom EAGAIN selftest
> 
>  net/ipv4/tcp_bpf.c                            |  72 ++++++++--
>  .../selftests/bpf/prog_tests/sockmap_basic.c  | 136 ++++++++++++++++++
>  2 files changed, 199 insertions(+), 9 deletions(-)
> 
> -- 
> 2.52.0
> 

Hi all, just wondering if you need anything more from me on this?
