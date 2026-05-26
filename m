Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA62868A7
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818695; cv=none; b=ExdqgL48LKH7n4S7Lqkoav433nk7KdZuGX1NEIRcKGi28mYI2eatvfmjJ1mRop32V8e+ECqHjAnnnJbVq55TkS+/OcwyYVuEgJpEWQZoLfstWOtHmGtNlEhxlafqoNZyYIXUB4DLTeeaCLsiWFr9ff1W702mMumqp9YkAZyuNDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818695; c=relaxed/simple;
	bh=Hpg7+gaRwC0fzm23+IgDfzCT5czjqsl3JNGC3HY0Jzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=aP4+YsfoW5GFloV2ld8CwEmPqMQbEid75GF6yh24LCOGOHp4TG5FmUnzj7tbFFqpv5dsiznv9i1YqpX1VpMHC2Ogx3NgBmJvXU0rFq0phkFR7jh79wlhNkke9ghEij7j/SlmslNTgbLCSep0gu0EUF2cmTJp4RAmlz7siKDwQsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DSYiLTJ3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DSYiLTJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779818693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7B46KU6eFKNnvfxIgVZcE15fNxhXjZLNYWHkZVfy8Jw=;
	b=DSYiLTJ3XSpl++p7ePQ8V9L4kuuCW8Ex5e5RHCYTCTKdO9HOf88L1T/TXj9Mjbbx+E5Ulv
	ICrJoPlkQmLTGEZVPLnJ4DP5cmYWX+2Kf8HLJXhon0N//rFHHCIqyIr/Fl9JXjIQlo801K
	7WYI4xiiZ0Qg0hxgIngKur2URwmh5a8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-OlH6jJjaOK6rIGp96MWPDw-1; Tue, 26 May 2026 14:04:52 -0400
X-MC-Unique: OlH6jJjaOK6rIGp96MWPDw-1
X-Mimecast-MFC-AGG-ID: OlH6jJjaOK6rIGp96MWPDw_1779818691
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b7105dfb5eso54240186d6.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 11:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818691; x=1780423491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7B46KU6eFKNnvfxIgVZcE15fNxhXjZLNYWHkZVfy8Jw=;
        b=BSFy6ZRbbYCpeNH8Jcu/r7GnZWPjHxjiBMiCJ6FjRYZ3lCu6UsC42mMYQjKtcG1qz9
         zwfR0MhuvcA55Fu68O0aqmq8+i5y7ajctIdzeQo8igwV44ldYiJctRul9AiyOrXirXB1
         PD40PX4lWQGNopFc1sNXnZDITW5cd4MGlaSXVqVu7rzhC2+KEoURS6NTdYIc1rxJv0t6
         o5wHchYp0zGPYuzO8jNU/T5Q1Ei9/pU/Jt3z6OOrrCVQkhrTSefgx4TxDi93OGbzAFbg
         ltEnNXQ7rMtVdoWbpJfVS0y8NPASasacykaphySG8CAs8K1nXHaF20oYe6F1O+F+T13w
         OQsw==
X-Gm-Message-State: AOJu0YyBA72X70HlcjTaueazkWLLbkmzdt8eOvv7vAbjxnCBRwxQw3sT
	KSV8zXyPY54pWDMPGIcVA2xzjj67y5uYp1F8FL0ukRCg+ZfsNA3TElHRDGVpHdNo2B8xBqvmBDR
	UZrGPIjJHhewe/pNSYOn8dnxZ7F9dGu7WkSh7M4SKEfWfeOu/wXq9qjIXHmTcs2rwn+4Mlf6cvD
	uHFTXMUsVNsi1U29G55wRtevTH+JcoELHMHLVugCX77BmIUIHwzPAFEw==
X-Gm-Gg: Acq92OHltSacfBP9jHqy1LdXiafRfGb5ZTHYdNUzxshO4hpRAHEfheP6YIe81AdAL8D
	VRzoYD0L6yMgNlBjx7/GfAHXgl7EdyeytWEYW8IWqeYrRkyPU50cjSbRfpQMYQSURLeS5L5cFL8
	zSrQyMMAJSQB+Zhe/mrZs2UgjmAdWYyZWL14nCGeVHWnSV80GK4XCN8qvG7L5Ywl5b1fsIs/3TN
	O9Ys14nVmNdRAwvmsnAF9IrXpVKn7FCLIdCZa98qq8bJOJDFvbPOPSSKtYa2ZeAKT4j1ynXMsC8
	7WFDkyZ267/DMA4Kf/fwa+4y/7TuvhPCAc3D+H2XsUSj0r/P4ZhZQeiF6cpWCoKsW/LjfijleE1
	gYt5FlpepZ/M2ckcukdr0NFWEDddAHaUzooIYj/eRYqDeyaLTtXim9k1BNB4C0MHJsg==
X-Received: by 2002:a05:6214:5016:b0:8cc:d63:96c with SMTP id 6a1803df08f44-8cc7b543a76mr313240036d6.0.1779818691237;
        Tue, 26 May 2026 11:04:51 -0700 (PDT)
X-Received: by 2002:a05:6214:5016:b0:8cc:d63:96c with SMTP id 6a1803df08f44-8cc7b543a76mr313239236d6.0.1779818690502;
        Tue, 26 May 2026 11:04:50 -0700 (PDT)
Received: from localhost (pool-100-17-21-205.bstnma.fios.verizon.net. [100.17.21.205])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc812e2018sm149613626d6.28.2026.05.26.11.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:04:49 -0700 (PDT)
Date: Tue, 26 May 2026 14:04:49 -0400
From: Eric Chanudet <echanude@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] cgroup/dmem: add dmem.memcg control file for
 double-charging to memcg
Message-ID: <ahXgKjmRbzQUDOLH@x1nano>
References: <20260519-cgroup-dmem-memcg-double-charge-v2-2-db4d1407062b@redhat.com>
 <20260519165048.BA021C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260519165048.BA021C2BCB3@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xx3p6X750PyVefUwa3k3uAtjfF2o0KWPw-IWS51qL9c_1779818691
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 19, 2026 at 04:50:48PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dereferencing `pool` after dropping its reference in the error path of `dmem_cgroup_try_charge()`.
> - [Low] Control file write handler `dmem_cgroup_memcg_write` fails when multiple spaces separate arguments.
> --
> 
> commit 747200dd3713bc67311fec5bfba25758569cc231
> Author: Eric Chanudet <echanude@redhat.com>
> 
> cgroup/dmem: add dmem.memcg control file for double-charging to memcg
> 
> This commit adds a cgroupfs file dmem.memcg that allows an administrator
> to configure whether allocations in a dmem region should also be charged
> to the memory controller. It handles inheritance, locks the setting after
> the first charge, and derives the memcg from the pool's cgroup.
> 
> > diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> > --- a/kernel/cgroup/dmem.c
> > +++ b/kernel/cgroup/dmem.c
> 
> [ ... ]
> 
> > @@ -681,14 +754,17 @@ int dmem_cgroup_try_charge(struct dmem_cgroup_region *region, u64 size,
> >  		}
> >  		dmemcg_pool_put(pool);
> >  		ret = -EAGAIN;
> > -		goto err;
> > +		goto err_uncharge_memcg;
> >  	}
> >  
> >  	/* On success, reference from get_current_dmemcs is transferred to *ret_pool */
> >  	*ret_pool = pool;
> >  	return 0;
> >  
> > -err:
> > +err_uncharge_memcg:
> > +	if (charge_memcg)
> > +		mem_cgroup_dmem_uncharge(pool->cs->css.cgroup, nr_pages);
> 
> [Severity: High]
> Can this lead to a use-after-free on the pool object?

Indeed :(, will fix in v3.

> 
> When page_counter_try_charge() fails earlier in this function,
> dmemcg_pool_put(pool) is called, which drops our reference. If this
> was the last reference, the pool is queued for RCU freeing.
> 
> Since we jump to err_uncharge_memcg without holding an RCU read lock,
> is it possible for preemption or a sleep to allow the RCU grace period
> to complete, freeing pool before we dereference it as
> pool->cs->css.cgroup here?
> 
> > +err_css_put:
> >  	css_put(&cg->css);
> >  	return ret;
> >  }
> 
> [ ... ]
> 
> > @@ -845,6 +921,71 @@ static ssize_t dmem_cgroup_region_max_write(struct kernfs_open_file *of,
> > +static ssize_t dmem_cgroup_memcg_write(struct kernfs_open_file *of, char *buf,
> > +				       size_t nbytes, loff_t off)
> > +{
> > +	while (buf) {
> 
> [ ... ]
> 
> > +		name = strsep(&options, " \t");
> > +		if (!name[0])
> > +			continue;
> > +
> > +		if (!options || !options[0])
> > +			return -EINVAL;
> > +
> > +		if (kstrtobool(options, &flag))
> > +			return -EINVAL;
> 
> [Severity: Low]
> Does this reject valid inputs if there are multiple spaces or tabs
> between the region name and the boolean flag?

Yes, I'll add a skip_spaces() before kstrtobool.
The format of this entry is being revised too.

> 
> strsep() will split on the first space, which leaves leading whitespace
> in the options variable. Because kstrtobool() checks the first character
> strictly and doesn't skip spaces, inputs with extra padding might fail
> with -EINVAL.
> 
> Would using skip_spaces(options) before calling kstrtobool() resolve this?
> 
> > +
> > +		rcu_read_lock();
> > +		region = dmemcg_get_region_by_name(name);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com?part=2
> 

-- 
Eric Chanudet

