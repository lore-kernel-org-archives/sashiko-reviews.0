Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541959;
	b=C1bqKBlp53Tni0VTSAxGviK/cckrMpkWX8V2e2J1BguudHFgqkSC3/eQKJIHH9SiY4Tm
	 EiRET61JR3fhbTQJupPth5ex/ewAOC2L8Xy+lmJbd3qbBFJ9jr1wXXD6TbXM8P2b1FfRm
	 hFkoBU15MgZnwvyKWUh0+7iccj2WpGI6JBXoqSrJs55yoKLoAbqcstPvCCxjb26JpSdgg
	 rLeLTsnaHbS8rgOU88TBCWNwtb64/jTOF4cQdhKqmeBM/HTFFgytJ3Xxfs9GOUz7bxNVk
	 dziEeOjvqd4tpThIjzDbDfycQquF8VeF+PVq+Uy1dDUW0oN8bIBewq8NPsmEft12nYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5eaBZnDCVfRabxJIJDdDONm6fhD1rR7hUy8thDW0u7c=;
	b=2NUobK+ZgiFwSLQltDgrpLbsFKLoNip/XSka8zP27lS7ub6U2XRQQmbOssOe25Cfyq0P
	 4jVWUDiDC5WZjYvY5qTinBjDW5zlk3A3DXfIxk06LmPspWjKiaOWufajaYBJyQqtS+k6S
	 OTKQhXWsC7LWpT1AGDmTNchFQdJANdR+QneEDurbs+8kW6zR9K+05pIDhhL+nSDDGUWOy
	 87mQlhAiCxSuB6IQWIFdJnJeeqn9FJ4X/gt8YLft/blvx4o+FzyvT61DgzMnwm/RxLIj7
	 VKyLd6OpertoFBA7EZJJEJJ5FsXASAXPRmbozAK5NQt354GT9ZP6MZMcaUzKWvy/dLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=L+2d7NRO;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C1E606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 00:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C1E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=L+2d7NRO
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so158053a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 17:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792541959; x=1793146759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eaBZnDCVfRabxJIJDdDONm6fhD1rR7hUy8thDW0u7c=;
        b=L+2d7NRO9e5xg5H+K2T5GcF61aU83IC/JUWKUVHEMB/G0I96rZFskQGGwB2JZ3wts+
         gHzSXD2sZYBvscQuytBdwD8Tyf0bkWny7MwbwIJW7fYgG024vVywHSmeta+e/gJ9dPck
         e4dQ6GUQF+BSvR+UcDJY5hU4qFvj6eGJKt1IwNKl3PYcPpjYWIJw8ces9OJt8oHB7kND
         mxmw+bM/TPRD5LbxYku99zPRy3OWaDJUDVHVqPHaAPfT4aFOM34nXXaCcnI8mS2MRnSd
         gKeLR7l+s24hCXQRNhSjSF7Hsnp0WB1gvvYTibDKL2Fajm96UKzPs6o863eoXRkYpRGK
         y81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541959; x=1793146759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5eaBZnDCVfRabxJIJDdDONm6fhD1rR7hUy8thDW0u7c=;
        b=jeq528I/l/O8VoBLquLqYtm0Yd4JoLHCU6YsTmZBeJF6ZGeBJDhCNYAmRJKlQ97kg2
         E9NKWPwX9QrVKKXpKWgDqvMTjOa1SYe53kPB04N9zzqs7xEjz5KBq2rInAKUF0QFQOFG
         67dyc2Ol88RpbuJuF3e+cbyJ11EXRn+q+d6LXnhjbx4alrx4pI1LdDHvC9zKjGs+tcCe
         ag9+PkR4++Wr3L5VGpXH6g0xVX55JtWxWccMBFuj75hNXqVLOSwEyf++smqa4U7/A2Gy
         vqpKey29VQmkJOS33jePdi5KvobZYa7wNhlCRDEgpaCtDx1kZzpJHkIJsT1kXYt2rkXC
         xH1Q==
X-Gm-Message-State: AFq9FYJ7+ZoJ4OvyuI1d0eWfFT3VBbtruxRCcGaruZw81yHZeOzl4Rgd
	yijsBBNFiuHsaO6jjy8wzHAdywiRSwdJLFZZPIgw6ca4Ii1QHPXHPCH2pEMv2L+HF14xMItjhpO
	9rqQm
X-Gm-Gg: AYBFou1SLtrzc3mOKQscEk8bwFDiiiCnx5cIqpAVIi6rxOoSqRyPqNDvSnLgTnu/RAx
	gJTpKiW65NFKzPpSJLjo2vsCGwPTPwFzapRzn/zY9czLvws1RYwcUrz7xkoUE+Jpf9nq9sG6Pzc
	zfSfe2891S7/jmQWI8Um8A5Ia65bdEjpq+kQDjBp6XHNnGkz0EP4IY4EdF0B7ByELEkqHK8n56N
	7gxLd0uNZsaDOlTQlf5xa6iTepAS1CQa32ffuqCIFRBbFAmGHYYCjnYNyTOhqSRZYvFaRWYVhU5
	SXAyOkwdzA2asQ9wtswkxsA7Eguv8T4SNr6UpiHRL6ekRCWl9pNouNd3SMadubtzUybErklZx3z
	+dt1vL4SmKChXG9N1F68KZvj/LKE2Ta7BmDkhIs2J84Nax7zOIopqit1po16uLzxCw2OS+MN2Qb
	vUelrePJ9bJad415AaqZE/HMYboTA0btS6PY2t9oGLEXHI92ZVDuNOLGI7dXNj8Z71iDVgU9X46
	eKjXWXwwC1O30kbLw7OHOriMg9Q9GahtenW7e/t/z3BWOS2LISEJKwxYJOoa3goD5M/3iEPIFhT
	+G4=
X-Received: by 2002:a17:90b:2646:b0:3a4:ca46:8d44 with SMTP id 98e67ed59e1d1-3ad86f1c073mr414697a91.18.1792541958529;
        Tue, 20 Oct 2026 17:19:18 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:e416:85ef:f22:6c5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8021ac2dsm1570973a91.5.2026.10.20.17.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:19:18 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-reviews@lists.linux.dev
Cc: Bart Van Assche <bvanassche@acm.org>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH] RDMA/srpt: widen the RDMA context counters
Date: Wed, 21 Oct 2026 09:19:09 +0900
Message-ID: <20261021001909.2343045-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-179333@kernel.org>
References: <20261020155725.2251969-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-179333@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

You are right: the indirect branch of srpt_get_desc_tbl() bounds nbufs only
against data_out_desc_cnt + data_in_desc_cnt, not against
recv_ioctx->byte_len, so a large table_desc.len or add_cdb_len lets
srpt_alloc_rw_ctxs() walk idb->desc_list past the received IU and past the
req_buf_cache object.

v2, which I am sending now, bounds the indirect descriptor table against
recv_ioctx->byte_len the way the immediate-data branch already does, in
addition to widening the counters. Thanks for catching it.

Yehyeong Lee
