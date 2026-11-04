Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787762;
	b=I4fKQNkPjPXn1u5Gmj9kV7YWPteZNRycKgiSOp0SkN6NgxZvGbrDUVW2HInlFH3qsbBx
	 3lq8lLbu40KUQhxmoB09wj5Vl4TBGDm3NJp/oX3XQ0kAmFz9Ci/CGkjVwHD9teD8RgW4i
	 uwHHQyom8GnJP9Tz0D/kpirezYSevHAUKCZPtKTnA7pPz/kAzPJsLKCUlDZc9+2Nt4fKb
	 dO80+NLC9xSP4gm1FJ6ZZEVuKXcRV9TmNSwvMaftUra6UgJrv6TLAdrdR+LCvvdxO3TUG
	 0m59qA6dYdWcdu969ZDB4Sv4CgiriscoDIhpSO8dS6UbRBc4VmFcXKYKyyC78nk4lvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787762;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=zs89ZAnRU7u7fNPI9JMnf/JQdJIJ8e7hYCupNJEz1H0=;
	b=o6rN+0slDMOHbtkR7JM8tNgT665z10M8sL3+OClRugvJJdroO+AjxUAfNMHs977Op3Gt
	 Y/71c81KrHkXvU2zeB0WcC/Eg+6zL18oxnMFGBxYW5Lngh3TwwmlLS3LiWwrpu59cNgsD
	 UYuju6mOcci9d3tGR5Hf2Wr/U7b15Fsrce2qw0WKNGJNw11g1veeeMxQ609rX2yXN0BFN
	 /xSgLAVjC2hes3MebSo5/LYAFR2DIHsmhFrqjaCPJLL6eyr0OI7Njq/c3R9sq+/1/Z/Sn
	 UpohkNUlcyZWCHMkvgRsK8kXZoUa/TGOBrsEqwwAZeclS1w1Rl0yYXNRUdoakLlpJ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lIqW8eSG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z0YdSJGh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lIqW8eSG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z0YdSJGh;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ACF606A31B
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 10:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0ACF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lIqW8eSG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z0YdSJGh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lIqW8eSG;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=z0YdSJGh
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1F34D21FBC;
	Wed,  4 Nov 2026 10:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793787760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zs89ZAnRU7u7fNPI9JMnf/JQdJIJ8e7hYCupNJEz1H0=;
	b=lIqW8eSGG/RrurF3PqsLcLYd4Y/cWy3HNf8HnX1ftX3deKcgYcx0KrKhQxwetL/2ntI9ul
	xa5FxpVd2XC1eyel3TRjSDR1a+Gr6s/eOhQUkEW96/rTq8SvTrx47J06IlyDr5yzYcpBga
	/whwKkFM+FaB38G4wTyDyNPSjMFtsGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793787760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zs89ZAnRU7u7fNPI9JMnf/JQdJIJ8e7hYCupNJEz1H0=;
	b=z0YdSJGhEoQUayOwoADqTrcCgKbD3U6MCsJNIFs7WZPTNzS9OHslckXy5cgThSao7YGbX4
	33dpTRUc1ewtDZCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793787760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zs89ZAnRU7u7fNPI9JMnf/JQdJIJ8e7hYCupNJEz1H0=;
	b=lIqW8eSGG/RrurF3PqsLcLYd4Y/cWy3HNf8HnX1ftX3deKcgYcx0KrKhQxwetL/2ntI9ul
	xa5FxpVd2XC1eyel3TRjSDR1a+Gr6s/eOhQUkEW96/rTq8SvTrx47J06IlyDr5yzYcpBga
	/whwKkFM+FaB38G4wTyDyNPSjMFtsGM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793787760;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zs89ZAnRU7u7fNPI9JMnf/JQdJIJ8e7hYCupNJEz1H0=;
	b=z0YdSJGhEoQUayOwoADqTrcCgKbD3U6MCsJNIFs7WZPTNzS9OHslckXy5cgThSao7YGbX4
	33dpTRUc1ewtDZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8503134F0;
	Wed,  4 Nov 2026 10:22:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g0GvJ28H62o+bAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Wed, 04 Nov 2026 10:22:39 +0000
Date: Wed, 4 Nov 2026 11:22:34 +0100
From: Daniel Wagner <dwagner@suse.de>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
Subject: Re: [PATCH v2] blk-mq: use a housekeeping CPU for passthrough
 requests on isolated hctxs
Message-ID: <623dff5b-f2ff-4ab5-a6c7-196f5b203919@flourine.local>
References: <20261103-nvme-fabrics-isolcpu-v2-1-95ec70d58254@suse.de>
 <sashiko-outbox-195610@kernel.org>
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
In-Reply-To: <sashiko-outbox-195610@kernel.org>
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, Nov 03, 2026 at 03:22:29PM +0000, sashiko-bot@kernel.org wrote:
> Should this check !blk_mq_hctx_has_online_cpu(data.hctx, nr_cpu_ids) (or
> ensure blk_mq_map_swqueue() sets BLK_MQ_S_INACTIVE when an hctx has no
> online CPUs mapped)?

Yes, this is correct. I'll extend the patch and add this to the commit message:

    When all mapped CPUs are offline at queue setup, BLK_MQ_S_INACTIVE is
    not set, as only the CPU offline callback sets it. The
    blk_mq_hctx_has_online_cpu test catches this case. It uses the queue
    map, so it also finds online isolated CPUs.

    When the last mapped CPU goes offline, the CPU offline callback sets
    BLK_MQ_S_INACTIVE while the CPU is still in cpu_online_mask, so
    blk_mq_hctx_has_online_cpu still finds it. The BLK_MQ_S_INACTIVE test
    catches this case.
