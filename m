Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E442E8F5
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585252; cv=none; b=LIKYAY6xDDujlmTpaqDp31o7FLEhJ4xbsPbuvzh/IXo1kBUAYaPOC0930/Hd7ir41NtqVgIXtVwiKc3Ed494TuJ68dN6d0W5kac3SVAmRJEEUo9NCBOmRxeU558E4nI6TN/fl+R4f/PniHBi8Zwok4JdMLtfvmpFGjFXXrd9ZaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585252; c=relaxed/simple;
	bh=7Ufq8Gqdt0Yq2rwd1UOICRPhbWWW4yi1uYk/x/Ivq1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOoNBLjuV/mKJ8bcRfgDk72cfqDJveAKRhZsFye8DrhSz7IrFtLnKwFJoHbZTOk6k6Q5OGSmTPGkD4zU6EsO3YbYW3CZ5JVb/6Ep4iemLJxtIYp5GjO1bbSTEvRQxqq3yWaYLvYqfU6plG0SziRhPo0yag1XvkKCWv7AT8bQGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iF2+O5Xh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iF2+O5Xh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-472326ca506so8214238f8f.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784585248; x=1785190048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mhIAwX66RMzzqWQQBA+7hZ0C/T1kQn62KHsmHZuPTAU=;
        b=iF2+O5XhissQYVnadJeJfCtnp/4eVVkl7gru2Qfc3cIyQChp36kjxr8Mih0BXIDR80
         QI0sAanADVL6VoRegB1vR1UxEL0kDfB7mO9yM3COj2YbbUeUKlel5wk2YuojI/ckjbGJ
         OqL6zH54eSFmC7lwYvyPu6VSMiZsyfoNuH+i/NgGyJhIARvDFEAjLHtbT3nQOmmaCpbU
         DY/u9yL4FVKxvPSkr2atLhSKRMQawLoknLcHNKgPZo3OOvyH5lmB5RTHfU6XC/hgT7Z9
         txkEE9mRwcYIc+F2g2/mOKc63lkWemWuitmZZCrbWblx7mGJPUSqSkUHZqrDLwNMjXZS
         oOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784585248; x=1785190048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhIAwX66RMzzqWQQBA+7hZ0C/T1kQn62KHsmHZuPTAU=;
        b=mFkpmSdIltNM/o2/+g+MbESYflRAhEvo856b6hVfaD1/4hUHEoPG9jDsGsb6vgxwRo
         UPrTvqBQV3oQDxrzxRsUEwRs/Hu3PzuUk6kG1m4iHzf00G5JgsaqHhE4/M7J2V8OY5wm
         4t9RLtwXCxJ85KUmp8ikUiRdgXmBXg+4o5mU0tK7bHwHk2DEnUEs1FR8EYQqKkhAUi7F
         E03GaGC/YqBcxzcR7Z7+QnwmplPTHZWY/AwSPHFqVg7CSuhwErv8qB+/qiuxkjZze7Un
         swepRCGcbmFtr5wpaLVGfZcw1i3RSvUpiRPNbRUYJEy2g9kwXODYYBKZNLa13g8omcxI
         9Z4A==
X-Forwarded-Encrypted: i=1; AHgh+RrcpTBoHcjJVbr6e/6Yw1jU1QKPF5j1j5bv/oaxVjRZl75Br6SOpdkH2Gn49zcVsk0WvXvAbqYNlOsVd019WRI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8yKUwXjayK+zLf/wHD8XiCUCa6NtcQagJOQJfNJQH0/csY73Q
	BVWwrIUVEQEyNM/cobPOwsW+GFpG6JcaZWL0C+7YkDkjm0c/S7qvTZL4
X-Gm-Gg: AR+sD13DFyhkHkTzBvG0dzqifBnjv2BXcKngKutFXnHvxnVdTPAbe1uF9ks6lNp+/uj
	JDamyookY+6OS6/9CmJWYTSpljTzzhWRkF1Wqc1jBS8QOA4x1hKaayiK6kkwv/idqii886h/KUN
	mfSXqNvBWAL/9Qea2euzqfqftsoSw730tnoTzfp6rw/scUeKNKMtH8yHbATI4bkkLQVi8DV3wYP
	8OQZdmw6kB+rZJhHRifVOmDvzVwbSMlaUXrIWUASA+G356It9toNOvhV7wjd70Fq5jA4sXeVdrM
	hTInzWyUcyBbsQ65ZR035npfbF4SlJhegJ3Wl2w0mDKcA/L4vIff3EDm3J5LKbmFcquQ2d9ltww
	jRdFJXkcwy3M5C9ZMyTr8ED6cLBDziaTtNrMBqyjb1VYv66+vMcAlt8MdzpsGheDdlC74yxfIqr
	4/7CKoQfZs/sCCYDcpac/5x7GD7X5pVKxaF0X8NBp59cA11G/1XLdRJCZm0QcU+6UiuQ==
X-Received: by 2002:a5d:5d85:0:b0:47f:6d55:a063 with SMTP id ffacd0b85a97d-47f6d55a3f6mr13332571f8f.32.1784585248103;
        Mon, 20 Jul 2026 15:07:28 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7c69sm35467457f8f.17.2026.07.20.15.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:07:27 -0700 (PDT)
Date: Mon, 20 Jul 2026 23:07:25 +0100
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: Emil Tsalapatis <emil@etsalapatis.com>
Cc: bpf@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jakub@cloudflare.com, jiayuan.chen@linux.dev, 
	john.fastabend@gmail.com, kuba@kernel.org, kuniyu@google.com, ncardwell@google.com, 
	netdev@vger.kernel.org, pabeni@redhat.com, sashiko-reviews@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] selftests/bpf: add sockmap recvfrom EAGAIN
 selftest
Message-ID: <al6amg9-PpZVpQyN@localhost.localdomain>
References: <20260720171535.67867-1-nnamdio@gmail.com>
 <20260720171535.67867-3-nnamdio@gmail.com>
 <DK3Q8PFVGNAV.GZNZC89346A9@etsalapatis.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DK3Q8PFVGNAV.GZNZC89346A9@etsalapatis.com>

On Mon, Jul 20, 2026 at 05:47:09PM -0400, Emil Tsalapatis wrote:
> On Mon Jul 20, 2026 at 1:15 PM EDT, Nnamdi Onyeyiri wrote:
> > These selftests exercise the tcp_bpf_recvmsg() and tcp_bpf_recvmsg_parser()
> > functions, to ensure that they are properly handling spurious wakeups in
> > tcp_msg_wait_data().
> >
> > The expected behaviour is that recvfrom() does not return an EAGAIN
> > error.  If the spurious wakeups are incorrectly handled, this assertion
> > will fail.
> >
> > Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
> 
> The test looks fine, even if slightly flaky. Running with only patch 2/2
> still passes sometimes on my box. Can we handle this somehow, e.g., do
> more attempts?
> 
> There's also a couple magic numbers in the tests that may need some
> explanation (noted below).
>

Thanks for the review!  I'll attach an explaination to the numbers.
Essentially the larger the payload the fewer iterations seemed to be
required to reproduce (on my machine).

With the issue fixed though, larger payloads and more iterations make
the test run longer.  Is there is a rule of thumb I should follow for
tuning the runtime?

> > ---
> >  .../selftests/bpf/prog_tests/sockmap_basic.c  | 124 ++++++++++++++++++
> >  1 file changed, 124 insertions(+)
> >
> > diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
> > index cb3229711f93..d18faf46fac0 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
> > @@ -1373,6 +1373,126 @@ static void test_sockmap_multi_channels(int sotype)
> >  	test_sockmap_pass_prog__destroy(skel);
> >  }
> >  
> > +static void *test_sockmap_recvfrom_eagain_thread(void *arg)
> > +{
> > +	int fd = *(int *)arg;
> > +	char buf[1024];
> > +	void *result = NULL;
> > +
> > +	while (true) {
> > +		ssize_t len = recvfrom(fd, buf, sizeof(buf), 0, NULL, NULL);
> > +
> > +		if (len == -1) {
> > +			if (errno == EINTR)
> > +				continue;
> > +			result = (void *)1;
> > +			break;
> > +		}
> > +
> > +		if (!len || buf[len - 1] == 'e')
> > +			break;
> > +	}
> > +
> > +	send(fd, "test", 4, MSG_NOSIGNAL);
> > +
> > +	close(fd);
> > +
> > +	return result;
> > +}
> > +
> > +static void test_sockmap_recvfrom_eagain(bool with_verdict)
> > +{
> > +	struct test_sockmap_pass_prog *skel = NULL;
> > +	struct bpf_program *prog = NULL;
> > +	size_t buflen = 1024 * 1024 * 25;
> 
> Here
> 
> > +	char *buf = NULL;
> > +	int map, err;
> > +
> > +	skel = test_sockmap_pass_prog__open_and_load();
> > +	if (!ASSERT_OK_PTR(skel, "open_and_load"))
> > +		return;
> > +
> > +	map = bpf_map__fd(skel->maps.sock_map_msg);
> > +
> > +	if (with_verdict) {
> > +		prog = skel->progs.prog_skb_verdict;
> > +		err = bpf_prog_attach(bpf_program__fd(prog), map, BPF_SK_SKB_STREAM_VERDICT, 0);
> > +		if (!ASSERT_OK(err, "bpf_prog_attach verdict"))
> > +			goto cleanup;
> > +	}
> > +
> > +	buf = malloc(buflen);
> > +	if (!ASSERT_OK_PTR(buf, "malloc buf"))
> > +		goto cleanup;
> > +	memset(buf, 0, buflen);
> > +	buf[buflen - 1] = 'e';
> > +
> > +	for (int i = 0; i < 200; ++i) {
> 
> Also here. Why 200 iterations specifically? Can we at least name the
> defaults to make it clearer that we've chosen those numbers because
> that's how we trigger the bug?
> 
> > +		ssize_t sent;
> > +		char ignored[128];
> > +		pthread_t thread;
> > +		bool thread_created = false;
> > +		size_t rem = buflen;
> > +		int c = -1, p = -1, zero = 0;
> > +		bool success = false;
> > +
> > +		err = create_pair(AF_INET, SOCK_STREAM, &c, &p);
> > +		if (!ASSERT_OK(err, "create_pair"))
> > +			goto end_attempt;
> > +
> > +		err = pthread_create(&thread, NULL, &test_sockmap_recvfrom_eagain_thread, &p);
> > +		if (!ASSERT_OK(err, "pthread_create"))
> > +			goto end_attempt;
> > +		thread_created = true;
> > +
> > +		err = bpf_map_update_elem(map, &zero, &c, BPF_ANY);
> > +		if (!ASSERT_OK(err, "bpf_map_update_elem"))
> > +			goto end_attempt;
> > +
> > +		while (rem) {
> > +			sent = xsend(c, buf + (buflen - rem), rem, 0);
> > +			if (sent == -1)
> > +				goto end_attempt;
> > +			rem -= sent;
> > +		}
> > +
> > +		/* we cannot use recv_timeout(), otherwise EAGAIN would be an expected errno. */
> > +		err = recvfrom(c, ignored, sizeof(ignored), 0, NULL, NULL);
> > +
> > +		/*
> > +		 * we are checking for the invalid return of EAGAIN, any other return is considered
> > +		 * successful for the purposes of this test.
> > +		 */
> > +		if (err < 0 && !ASSERT_NEQ(errno, EAGAIN, "recvfrom eagain"))
> > +			goto end_attempt;
> > +
> > +		success = true;
> > +
> > +end_attempt:
> > +		if (c >= 0)
> > +			close(c);
> > +
> > +		if (thread_created) {
> > +			void *retval = NULL;
> > +
> > +			pthread_join(thread, &retval);
> > +			if (!ASSERT_NULL(retval, "retval"))
> > +				success = false;
> > +		}
> > +
> > +		if (!thread_created && p >= 0)
> > +			close(p);
> > +		if (!success)
> > +			break;
> > +	}
> > +
> > +cleanup:
> > +	if (buf)
> > +		free(buf);
> > +
> > +	test_sockmap_pass_prog__destroy(skel);
> > +}
> > +
> >  void test_sockmap_basic(void)
> >  {
> >  	if (test__start_subtest("sockmap create_update_free"))
> > @@ -1451,4 +1571,8 @@ void test_sockmap_basic(void)
> >  		test_sockmap_multi_channels(SOCK_STREAM);
> >  	if (test__start_subtest("sockmap udp multi channels"))
> >  		test_sockmap_multi_channels(SOCK_DGRAM);
> > +	if (test__start_subtest("sockmap recvfrom eagain"))
> > +		test_sockmap_recvfrom_eagain(false);
> > +	if (test__start_subtest("sockmap recvfrom eagain with verdict"))
> > +		test_sockmap_recvfrom_eagain(true);
> >  }
> 
