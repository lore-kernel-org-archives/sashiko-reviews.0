Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793229244;
	b=2XmtA0My26CyskOaG5sAzz1Bt/l3w5tRi7w72MFycq7rc4Ogi5WapntxVicgcq8P+XqY
	 HBUQqO2lN46IBzInrIjblw0d6HyFQd2cIQ/KS1PSj7xGah8rjHDN1usPKwx50d+igqnDX
	 lZLxBiMC8cp3xlIWHQks5tV0ovgtNhkuFrKdy/kWf0ecK4KgscyMgh/NjTltN/75GSjTH
	 XRVcGRODcp01wC2d+N6bHaWsqmUvuWOC7cy1+LzuyEkDChgLC0wwu+4S2gVVR3nLhT7E+
	 lasamuwzorKIwSDwlmAvi4jIybpZxY1UgQ5GaDuuAjoqqcyOGIFpqJZpzHLbOmNcMkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793229244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=puyAoc6Jf4frehbhlLXQIfKglUE1ElIfqgej2JSgVAA=;
	b=p4ICWLIBA/n3ODUUXnc4FvpzKILhsH1BNsXvjdl60fsH9KAyIDut0qno64x/ndZoZIWf
	 1l2azU0NV5R+C5TMZqKD4MyE/QoGFnXMo6ENJraNW8Ud6iW2HhPcYdtBd1cxecQIxm/F+
	 85kohXTRyz7KDeZTUnhGJp1IqRMlG3HC8MIogy3onESTDX6WPx7STENex+3OvNzDBNWum
	 ei6PcisVXpEJOxw0PNcDaA/MluTbe/JDd5oIC1TmXQBOlqVXRgJRlL0iQynfhUr2YjzmY
	 5E6EZZkGmDJCryykBUUCbTxjHzesIWhtx5gMQBUtXYR2Y8q8P3gwnsm1d8Fg/uVhlbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CukPiP79;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979B6606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 23:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 979B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CukPiP79
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a05b210703so770945b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 16:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793229243; x=1793834043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=puyAoc6Jf4frehbhlLXQIfKglUE1ElIfqgej2JSgVAA=;
        b=CukPiP79ezojn+kLMVhQC3Z6Mj9OS35H7mt+zTZIiARjv5mPe7ohaJjeKe0qr/tcNP
         ZiCZmY5Njs31sIxUCwyhWaW+zFueX/HZXzbpMN6aiJTs8u85kNJ+7goP/ttSg0WHNev0
         HrMd87tiumtSYBbPX+9wI7PqsUFs1dUcTwBtVtH452+RC5t9D0nZ/iQeLPW0Lb1nOnz6
         xKEA1TmNvrugyu6zzq7INLjdlAeqo5k1ohdZH0FyqmO6a2GcoNLZEbJRKRawtlD0B2i+
         XUwwZ++Uvbei+DyrE8p/kVvzi/wTYXtmiY0IJHBs7QtiASiID94tD4/I5duIAnmWZNMB
         xGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793229243; x=1793834043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puyAoc6Jf4frehbhlLXQIfKglUE1ElIfqgej2JSgVAA=;
        b=ySSYH7wCDNMVduuEuoWBC2ZdIucfMk8zc0wMffqU7BW9ipSMiGZVlWYr4BGrYWcGgQ
         muZfRaZ6b5+nbFhPPoXqCp3HP2JivgeoGARykstWEGvzUmCvnL+bVBzgMdOiWG50Xgzb
         6cJtV8i5k4SicHvAc92s7BD8W7n9WFZwqj/Siz3voQDjRbEM03ay4t6sMGLfmh0vDtfP
         WBIjA1Y1WUqpk5+caZLPvNUaN/1xGZJ1NZp6pxM0gOtXG/UIZDQIrUGXgFLOeIEUqHzR
         3fxcsTlSDYI6ijLArgwBd4/ajIU4gqaA3z+1Z3XdgaI8c5RtMQAQpgIS7emeg0QDvmJq
         UkNw==
X-Gm-Message-State: AFq9FYJiYksSEezYNX2aVzS+JT4p8S0hz+550KgZ4cSWqgl4lmBZfhS6
	2Eea+ewzpWTn1j8Sn95f4yGzuiTKpAPVYfhGv1JFKus+Emd93ChnWRbTcbVt9JxyEGEitxQ1l/n
	Pr6XF/gjQ
X-Gm-Gg: AYBFou2BtG1jDieD05DhXTxVjjtrrxjWr9zOTAnk82lrtu2GQb5AY4vjG7MhBIPOupV
	+W0av04NVbUv+KpVevfwvtlE99iJmHm3zqnnDRq/W9GQzqqwBMpNDGMlbmaRoUFrLIsMq0mPaXn
	YJzuCexzknGkZ6b9Mi8t15d6Gkh7yIdo+29uQFJAshEFniifturM+QwtYb+V9gdaoTOt1JHTtQ6
	EqFloLhHy1OhSxD8AXs76k06RdJt22Zfy7fVJotlc6S4mPIY6fqw6Tjj6RS44/CdFEcZjpOi8mH
	kfv6PdmNpelzhBjmnkifkSKxunEd9VnFbAQj5LG7s4TWOv/v0RclftaXO/sCjEUl+YcC7l3vTd2
	c8bg0jr8MEH9r+F9PcNeCttM/G6HYvcCbFqfaPSLadMRTiMq3vsPjMM4JsZAhn6TMVbIOIFnKfD
	uKY9umAnoIukvxcPCjpfzmbHfR92LqYoBSR5F0chn3TGZp8aD33CEluk2ZBfcTqpGGv5HJeo5oc
	HFp3ELB9QVrYGK3/qq/i5ZyGvCeEuxmRw9wO5Zn16U8BtDQmVegntA8TdLUpd9FnWDNEvDojvzE
	36KosAroM9x+/PiwOgpGMEjcFLUBdfuF6xEA3xSfL+qUe87GVAvgezOHGxmf+elfWLxmn8HWV/6
	NONZ+FF8cKYw0lTK/
X-Received: by 2002:a05:6a20:914c:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3e9022d6cbemr3267144637.26.1793229242275;
        Wed, 28 Oct 2026 16:14:02 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a6cfa342sm1626775b3a.41.2026.10.28.16.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:14:01 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:13:57 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kexec@lists.infradead.org, linux-mm@kvack.org,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 09/10] mm/shmem_luo: Allow retrieving tmpfs files with
 O_RDONLY
Message-ID: <auKBtVmCS4jU8e_R@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-10-dmatlack@google.com>
 <sashiko-outbox-183328@kernel.org>
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
In-Reply-To: <sashiko-outbox-183328@kernel.org>

On 2026-10-23 10:51 PM, sashiko-bot@kernel.org wrote:

> > +	ro_file = dentry_open(&file->f_path, flags, current_cred());
> > +	fput(file);
> > +	return ro_file;
> >  }
> >  
> >  static int shmem_luo_retrieve(struct liveupdate_file_op_args *args)
> 
> [Severity: Medium]
> When userspace retrieves a tmpfs file via LIVEUPDATE_SESSION_RETRIEVE_FD with
> O_RDONLY in arg->flags, does passing the raw flags variable to dentry_open()
> in shmem_luo_create_tmpfs_file() in mm/shmem_luo.c bypass the flag
> normalization performed by file_open_root() -> build_open_flags()?
> 
> In fs/open.c, build_open_flags() strips O_CLOEXEC and ensures O_DSYNC is set
> when __O_SYNC is present:
> 
>     u64 flags = how->flags;
>     u64 strip = O_CLOEXEC;
>     ...
>     flags &= ~strip;
>     ...
>     if (flags & __O_SYNC)
>         flags |= O_DSYNC;
> 
> Because dentry_open() -> alloc_empty_file() -> init_file() initializes
> ro_file->f_flags directly from the passed flags and do_dentry_open() only
> clears:
> 
>     f->f_flags &= ~(O_CREAT | O_EXCL | O_NOCTTY | O_TRUNC | __O_REGULAR);
>     f->f_iocb_flags = iocb_flags(f);
> 
> passing O_RDONLY | O_CLOEXEC in arg->flags leaves O_CLOEXEC in
> ro_file->f_flags (visible via fcntl(fd, F_GETFL) and /proc/<pid>/fdinfo/<fd>),
> and passing O_RDONLY | __O_SYNC without O_DSYNC leaves O_DSYNC and IOCB_DSYNC
> unset on ro_file.
> 
> Should dentry_open() be passed (file->f_flags & ~O_ACCMODE) | O_RDONLY instead
> of flags so that ro_file uses the normalized flags from file?

Yes. I will fix this in v3 to re-open the read-only file with the flags
that file_open_root() already normalized.
