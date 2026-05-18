Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA19B3F0746
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 10:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779101322; cv=none; b=G9Gme0DrdSROCzRh2RuWkUYLmWcrMMsYxjuPk74B4spJvpaPTr36VFKI3jth3nvrjm7RlDLA4Q776u3yykkcP8UHeb769YNw7RsojOCrqT1OfoaOWfU/0veRc/ka6PiwZeAI1ooeqRzccjgQb+jeCePOG7wrnN3fYEQLr9bLA8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779101322; c=relaxed/simple;
	bh=9eqBSU6bS6ELUkt4XLYwS4O8nD77BHPKLRhElrn2RiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psF8LHDg8eZTEa7QERNM2fs/x5H1zKblX0b5w5oh+VqhenANGqmqh8B6Dk9ySvsbNQv1qWppuSxtgQAHdicISOxmDwMC6Q6PvaOuoZ82BLa6IPpUYqClLcevy8NwPyoZxvZq84D/R12y+6bvEoSF+NfGwZSFaHgjMwXapMsa3/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSe7iPUw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSe7iPUw"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0046078so18843385e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 03:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779101314; x=1779706114; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3UVJjriOurip2RmNBt+r/CGVEP8Shyp9h4jU4NjixPs=;
        b=cSe7iPUwMCd7paXDj01ib/TVwGlt7r14VcC9Za+8MiLHfEt3X5nrdn+q3UtsiihSQ5
         stN5OuiozA5ijuoJkW0EaMzE3t2GPXBzV+xTloo8iksagUOGHZzGmX7romgtnXAEnyG9
         M2HTagDNWqBAQCdloC29J8nJzW3wXHGHFP/Is4lbihrt17+WL4QzIl6dTV1oxhMVt9qN
         S7gBdg7dV00oYvmppWa3LcvjJiJ7OEhndFAJIh67vJenV1xYyMMTvpeFuiq6SFCk6MXg
         Xo/j9oCxVvVPE213TLY8+MyUjvAkEs9KPIsVdWVV9vqC7uzOwsyMN8Rvd2EBb240IgM4
         Epyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779101314; x=1779706114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UVJjriOurip2RmNBt+r/CGVEP8Shyp9h4jU4NjixPs=;
        b=q+G6Ezm7i0LDj6dQyMWXdtyGrfowh7W8/mfChTgA7dDRD3OVcLE5jqsDkouNr8jZb6
         JtMB0tVN3gE9yTTYLaYyiDRRWKPBmpT84h3GHZk/BDx9fSja+9FMTjxk5SSPml5otVNg
         QCwrKdlyTdBKOsRivYI/bs41XT+RrOPYwZAvlx7gGoNWAQQazo8JJmm9Jz1JtuU25SCs
         YnUXuA3PCnDjFX68pqdXqZWlQNUmJ09dDnF9URJzcbhb1CPeVF//F/XQ0ADumXKUi5TS
         5mMBV5DzvaSy1nSSLXTTP9k4lUoqk2crZQJHKY3UQB2PQggSVKCq4ClnbFoKwOFq9UhL
         6rzA==
X-Gm-Message-State: AOJu0YwYx0Ge1p6FRoAuZepsvdrQ0M4hh2N4IjY8TNOdu4iaadBbYY3y
	j+IWfFffn+qSQ5nLEVbWu8JjEZGhZM5ZwTk5VPQ32waoMIUiBAYFCDx9py9ObHei
X-Gm-Gg: Acq92OGwbUzOMhd4/HS9Z8ERtSAa5vNbYJ99zydsvyTSwb2Cib2CYH0TQvGaMNQ319A
	Fd/htZk14DNK/82nGELoG8R5pKEgTSHEgVYTd5M5xd9pTBgjoxjK+qJZaaZulRGZ9ml6Py4lXsC
	JH8WPH3QxlUn0GQE/Om9XFh4BU2T/Qlp061K12aRNaXhddMqwbvLVU79LnL0LtPKYjtULbzcICy
	EZ371XFIkYQhGj11KZGb6HEjYeIiSi/Fx+TzWP/IumYQ3a13H+jsidFxIVhXopc03NuyKLOWL78
	p1GPRyVq/3yjdFc3Wg/tnq1h4y/tGJnDUYTGjFTGQfB5n07+MiG8TzO0WQWVY7TGeVFsnO+FbFh
	SHF9mjL9MiO1xkUeQvs3fw7/V6DFVCQErke28syYwGpG4yewmvxYiw5ECf3Rpn5TI/VQbT5oOOF
	DDbe48VJVDinvimJCIGnMgzgg+9JtZlx+TGDfJDf3MRFyYCeaSJ6/lJ3/VMnW4
X-Received: by 2002:a05:600d:8496:10b0:48f:eb8b:9980 with SMTP id 5b1f17b1804b1-48feb8b9ademr132451955e9.30.1779101313032;
        Mon, 18 May 2026 03:48:33 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm269031135e9.7.2026.05.18.03.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:48:32 -0700 (PDT)
Date: Mon, 18 May 2026 12:48:30 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v5 4/4] selftests/bpf: add bpf_icmp_send
 recursion test
Message-ID: <agrufs1IOhth-U2X@gmail.com>
References: <20260515194746.50920-5-mahe.tardy@gmail.com>
 <20260515210052.BFCB1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515210052.BFCB1C2BCB0@smtp.kernel.org>

On Fri, May 15, 2026 at 09:00:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing packet filtering in root cgroup program causes system disruption and state corruption.
> - [Medium] Uninitialized `unreach_type` prevents ICMP generation and causes guaranteed test failure.
> --
> 
> commit 58dd624e2dc9a29c48c701ba76fcd20e713e626f
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> selftests/bpf: add bpf_icmp_send recursion test
> 
> This commit adds a new test to verify that bpf_icmp_send returns -EBUSY
> when recursion occurs. It attaches a BPF program to the root cgroup to
> intercept the generated ICMP packets.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > index d9badfc6e620c..2363b1c7c711c 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> 
> [ ... ]
> 
> > @@ -173,3 +175,41 @@ void test_icmp_send_unreach(void)
> >  	icmp_send__destroy(skel);
> >  	close(cgroup_fd);
> >  }
> > +
> > +void test_icmp_send_unreach_recursion(void)
> > +{
> > +	struct icmp_send *skel;
> > +	int cgroup_fd = -1;
> > +
> > +	skel = icmp_send__open_and_load();
> > +	if (!ASSERT_OK_PTR(skel, "skel_open"))
> > +		goto cleanup;
> > +
> > +	if (setup_cgroup_environment()) {
> > +		fprintf(stderr, "Failed to setup cgroup environment\n");
> > +		goto cleanup;
> > +	}
> > +
> > +	cgroup_fd = get_root_cgroup();
> > +	if (!ASSERT_GE(cgroup_fd, 0, "get_root_cgroup"))
> > +		goto cleanup;
> > +
> > +	skel->links.recursion =
> > +		bpf_program__attach_cgroup(skel->progs.recursion, cgroup_fd);
> > +	if (!ASSERT_OK_PTR(skel->links.recursion, "prog_attach_cgroup"))
> > +		goto cleanup;
> > +
> > +	trigger_prog_read_icmp_errqueue(skel, ICMP_HOST_UNREACH, AF_INET, "127.0.0.1");
> 
> Is it necessary to set skel->bss->unreach_type before triggering the program?

Yes it's done in trigger_prog_read_icmp_errqueue.

> In progs/icmp_send.c, unreach_type defaults to 0. Looking at bpf_icmp_send()
> in net/core/filter.c, for IPv4 it requires type to be exactly ICMP_DEST_UNREACH (3),
> otherwise it returns -EOPNOTSUPP:
> 
> net/core/filter.c:bpf_icmp_send() {
> ...
> 	case htons(ETH_P_IP):
> 		if (type != ICMP_DEST_UNREACH)
> 			return -EOPNOTSUPP;
> ...
> }
> 
> If the kfunc returns -EOPNOTSUPP (-95), no ICMP packet is generated, which seems
> like it would prevent the recursion this test is designed to verify and cause
> the assertions below to fail.

I think Sashiko is confused here as the type is indeed set during this
test that actually passes correctly as expected.

> 
> [ ... ]
> 
> > diff --git a/tools/testing/selftests/bpf/progs/icmp_send.c b/tools/testing/selftests/bpf/progs/icmp_send.c
> > index 6e1ba539eeb0f..a2ef6a02c2cb0 100644
> > --- a/tools/testing/selftests/bpf/progs/icmp_send.c
> > +++ b/tools/testing/selftests/bpf/progs/icmp_send.c
> 
> [ ... ]
> 
> > +SEC("cgroup_skb/egress")
> > +int recursion(struct __sk_buff *skb)
> > +{
> > +	void *data = (void *)(long)skb->data;
> > +	void *data_end = (void *)(long)skb->data_end;
> > +	struct iphdr *iph;
> > +	int ret;
> > +
> > +	iph = data;
> > +	if ((void *)(iph + 1) > data_end || iph->version != 4)
> > +		return SK_PASS;
> 
> Will this cause system-wide disruption and state corruption by intercepting all
> IPv4 traffic?
> 
> Because this program is attached to the global root cgroup, it will intercept
> all egress traffic on the host. Without further filtering for specific test
> traffic (like protocol, port, or destination IP), any background IPv4 traffic
> will trigger the program and call bpf_icmp_send().
> 
> This seems like it would generate ICMP Destination Unreachable messages for all
> legitimate background connections (e.g., SSH, DNS, or other selftests),
> causing an ICMP storm.
> 
> Additionally, concurrent background traffic might cause races on rec_kfunc_rets
> and rec_count:

Ok let's forget about this, I'll just revert to SK_DROP and confirm that
this will not cause a system-wide disruption and state corruption for
this test case. I need to use the host root cgroup for my test to work
and this should be fine.

> > +
> > +	/* This call will provoke a recursion: the ICMP packet generated by the
> > +	 * kfunc will re-trigger this program since we are in the root cgroup in
> > +	 * which the kernel ICMP socket belongs. However when re-entering the
> > +	 * kfunc, it should return EBUSY.
> > +	 */
> > +	ret = bpf_icmp_send(skb, unreach_type, unreach_code);
> > +	rec_kfunc_rets[rec_count & 1] = ret;
> > +	__sync_fetch_and_add(&rec_count, 1);
> > +
> > +	/* Because we attach the root cgroup, let all traffic pass to avoid
> > +	 * disrupting unrelated network activity. Otherwise we could just let the
> > +	 * first ICMP error message pass to trigger recursion and drop the rest.
> > +	 */
> > +	return SK_PASS;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515194746.50920-1-mahe.tardy@gmail.com?part=4
