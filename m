Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279674;
	b=HRRRyLfikc8NLmLGGf0UGRCWSjTSxQbKIB6duWgevad3bcJDI583HreOQuQ2cxKbXwtc
	 AtpFuMIbxeahRMrZ6W7L7+1U2V78cqP88VQF2xjMpDfjiZh8M/Fr1LMNvTplBnq7WP1zR
	 Qd76vdrrLBamuG5sXWlglczgcn3DEcRf6l8V64b4wN3hHNVN62eC169rvRf/XgW2r6NsZ
	 hB487Fi6qgKOtLCn/a1jx7L3Ioy+XWXNxoP4A89tnj0w7JK/0KFlHiJNmsV0YcblPyneH
	 XCgs4JyduV1kh12crkM72uJnMxQN5YnHTAIyUnINoeD5SCAFnNRW51rvnXzS0Kt3qUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=keimOPBn6zqYZGZ+MFySGLhtS4gerw7P0fcwObyzCWU=;
	b=aXLSmTNSwXRmcCcJublU0FDyiTQs+4PenL227CFGc1nEFZw6EsasPixgFmNi+UGxnCpz
	 QJFb1pfPcujw0LfDCMZRDYTi63fXpT3NEGCwiJ7A/3jAMmpMct7V7+EZtodI4GiKL+Pl+
	 IZODgUkm/F00di8Bqc8/QwXfYJj+7+6VlwFvozQYT/txeyymaVnlqf3pz75UI8KbxXtEI
	 Mhm9sV21ZraFISkVkgGwYzp4A1m+R7gRNctzldhCYn1EQgw9Fli69TbNFNme5aW2cTOB0
	 fmxTIkar/NUIeU46M7w6ovL0qF2Z+gloARg0q5GFsh1cvuFhedoKJuqBilLipfsxydg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jkgHjOcs;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C10606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 03:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C10606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jkgHjOcs
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so4998925ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 19:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794279674; x=1794884474; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=keimOPBn6zqYZGZ+MFySGLhtS4gerw7P0fcwObyzCWU=;
        b=jkgHjOcsPlWHvOVY2jTv47hglSlFVpUs1GQpOz36dChzIDFsMNwU/fn++T6PPVSMWp
         jGu7x1TP5f0bTDPott3ZYD3lC0OajaXPxQUnzhNb7aPVl4phGnJWPjs0HWWikwAyF8X3
         /02pOnBDVYF7dZkxGrNQMe3xrFBGZMe7AtKSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279674; x=1794884474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keimOPBn6zqYZGZ+MFySGLhtS4gerw7P0fcwObyzCWU=;
        b=OXU5zyNjGQagjGK6ahXpwe2YEHDp/bmPv+JGD5v/9KQ3n+8DN7/GjmLJv8V4P74bF/
         xBuiSYiLvQqVMUBjTPZjvdB/gdd+7i8qF8kfiYK1lJKDow+E9GRcR+jH6xLBPnKAFGjQ
         ukbW6GTtyxcKdXv72n/VEZqCWDbf8xubRbh+3pXJnttLFTT+6aPNMev1bIGbg3i9JCBr
         7ZNZubGGJRzM6zQWmsDksmVfzG2RIhNWyETLKVnmpnYKDjbjnm6XtFIpuOBcx7/XgW0B
         Ai9sPaQEs1oPwSrtjsF4U95eMfHEzBuq1l5ak5dlSqncCYCU8RVUMcraUfYXW5YDUSvg
         MmhQ==
X-Gm-Message-State: APuU4Z9rmVReuVkYShn6AsJ1bVoO2VLJ1kwjqAhyzfTec9tcYz+jo23m
	b+nD29Kt47rAvQqH5tvKT7e9nk1QmUePj9l+mKpc6G+ugc+lXGorxHuvp2PYPYMoD+XJTl9YBQk
	XHs4=
X-Gm-Gg: AYBFou2PHp2UsIJ0Z3DJY5m74TobhODTxzbEuoM5kdivooQaNKRm9VBNlxLYQCzpghn
	RxXbeBMP6NOelLXG6e8ij9EuBX2F5Jbd2IpQD/HsqmFjttUCHiWG8gDrrPcDSOf1FIYfcIpjOqw
	Q7MFpPcWbGcpjMFkiuZziqAOi8aDxDwljlCWwv787+PMARJqDRthxSIPrhgRAoshG1TVjiDtofH
	Lv5XlKzML4AgBYHRY9FB0Bv0mTMvqYRBZ9kjhQi+Cs7bygJboOoSLG/u67XE3I6LF2UmxHlt/sd
	JG0mW9S53gXnQZ7oYGVScigu/FyMFHLw4MlUzsRPRL7b+ZtJD6ztM1fprpvqMKF7zgh/DU4djbi
	HN25IVnUoNted7Z+3QRRvx4piA+LpxXpaRxHPQTnFuERPyU8bkRcl05iu0Y1yB8ZKwehS3GjsMW
	7jXbCWuTjtAa3WLUp8h8mYra4q1aSwc1LjB2Zq2HpA0e9i1hheQv+fd/FoJsvZS+OjZMQPIPtUf
	M59aCNI4uTUkbDYao/c8FEe/TEI1ENZftryxgJd2fXuhN29ktzLCjMxKKIz72vaWMrVAcXsdnYT
	wSh3lj8s/gLqKCn5w3yHOkM7LjfQG4J7em87u4I2/9c1CJKB5pWp221bJJ+1zBre0qNFyw==
X-Received: by 2002:a17:903:2f45:b0:2ed:1c15:ffc0 with SMTP id d9443c01a7336-2edb91be092mr12516445ad.30.1794279673820;
        Mon, 09 Nov 2026 19:01:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dc9ea4sm3699045ad.54.2026.11.09.19.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:01:13 -0800 (PST)
Date: Tue, 10 Nov 2026 12:01:08 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-mm@kvack.org
Subject: Re: [PATCH 4/7] zram: allocate zsmalloc object under slot lock
Message-ID: <avKISrcR0goF2NXv@google.com>
References: <20261105044752.1997895-1-senozhatsky@chromium.org>
 <20261105044752.1997895-5-senozhatsky@chromium.org>
 <sashiko-outbox-200764@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-200764@kernel.org>

On (26/11/06 04:48), sashiko-bot@kernel.org wrote:
[..]
> > +	slot_lock(zram, index);
> > +	slot_free(zram, index);
> >  	handle = zs_malloc(zram->mem_pool, comp_len,
> >  			   GFP_NOIO | __GFP_NOWARN |
> >  			   __GFP_HIGHMEM | __GFP_MOVABLE, page_to_nid(page));
> >  	if (IS_ERR(handle)) {
> >  		zcomp_cstrm_put(zstrm);
> > +		slot_unlock(zram, index);
> >  		return PTR_ERR(handle);
> >  	}
> >  
> >  	if (!zram_can_store_page(zram)) {
> >  		zcomp_cstrm_put(zstrm);
> >  		zs_free(zram->mem_pool, handle);
> > +		slot_unlock(zram, index);
> >  		return -ENOMEM;
> >  	}
> 
> [Severity: Critical]
> Does calling slot_free() before zs_malloc() and zram_can_store_page() in
> write_incompressible_page() and zram_write_page() cause existing data in the
> slot to be lost if the allocation or memory limit check fails?

Realistically mem_limit is the only scenario to consider and I will
move mem_limit check before slot_free/zs_store.  The mem_limit was
never a hard limit anyway, overshooting it by one zspage is not a
huge problem.

The zs_store() failure is very unlikely in practice, because it implies
a 0-order page allocation failure.
