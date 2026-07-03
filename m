Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED803148D2
	for <sashiko-reviews@lists.linux.dev>; Fri,  3 Jul 2026 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073211; cv=none; b=NppkVkmOMmxPpP69+ClLSnGxxHZY7bV/acn4ZP4IT+anqCBQKGQ3r8mAIlYYuZAfIltMrtl/AH3syfDnKTZZTor/yCXTY1LCTeJQHkLwIaW5qF5M2zzdjpIAKFUvUwTbjOH5iL7h2ycj3KYdS5AM16d6iYMN2KmyyNh/hUO0zXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073211; c=relaxed/simple;
	bh=laBEFR0I3RWvs1+Is2iqG1fnTejy7x7hXOUjl6aoww4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZwIWBykU9x8NTfE44D9CF18Pvvmis5zGbrmc2lIM1H6JAZdckLkkuup1wHeIoKwG0/aNauJKpWC8YyQh/WNMrmymK8dfPwApIo5CgP3211kWbXP8X/yH8WaqNm9xbwETtCjJOeCHjpFfIgMVtLEvrDQzbR8MN9Rpo5aVxFKI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ypsu0chi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ypsu0chi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso2411695e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 03 Jul 2026 03:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783073208; x=1783678008; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yYQ94JtDIgj0sKRw/RmLXkJVierqwHbIhkMFu0H0wXY=;
        b=Ypsu0chiUYA0NTKyy64yWoMl6x2HPi5ngNBvRWArI5OpP1gKZsVdo8DLC5ipXqwh7a
         RBX5o2B+aAoriOLdI68X4I/z5e7pLE3ivA0KhbIuNpAW3ExwHWuf8ueMHfYqvsspjWC2
         mn1IZ4UaszAmHEz03pHCfe7QV0QnStrJFxUGkpTl1JcuNT3b/EsgTNJ5TJgKIrddefzG
         MQqHNN76PvtKjcdFv2qYf+1MLwGySx3U4ccl22BTiP9NauSWOB5eb13ttIjXOZTuM8oa
         LxPmksjePY04p09sGr6sAX0jCikYVQxf8/DAxh7lJi13tncndquSrmc/H/dPejF5yLfM
         PXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073208; x=1783678008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYQ94JtDIgj0sKRw/RmLXkJVierqwHbIhkMFu0H0wXY=;
        b=iPheYgigSLT0fuiysJu6BMdS+UDHJVoNiUflmJ5x9O3dNxTz8YoJ0/X88vp1MKBDzz
         QOstTM9cXlhPYsnf92yQq+AKwDET2CQDB1LhFaG976r1ty7+TbkXYBHg1bGiIyK62jGB
         wLFL+ed0ydXGZq0dkilhoQ27xeWHOYY+u16jgRMruP+p5Q3U6K58D61ebzkQnkZBqKj5
         jCMRpMvB6mAGxyqlX+BU8CTDjt6Cni9Mkywpv2h478ylreh8yuKizvy8z5B2wnTYOau2
         acMgMwaATvjes+1+E2H9nggsWPnJH1vugJDuSYaMxOpq1Bgpfki3PQ2S9C6FgFxBcMxM
         XN+A==
X-Gm-Message-State: AOJu0YztuCEWrsfyqaW1GkumRxeNc7iC7IefW9qNKwyQcmnGwfB3fkb5
	hCJJUnTGPZsN0WvgNAGX9BJbnqZqg5g+1f9VYx4Nn3YX62PEQh/Km4BGm1c31I3xRN8=
X-Gm-Gg: AfdE7clSseKZBv931UgxeJmRl8lsi5uOBOPjq7HMwQqAE4F/A4/oeSr3vtVp9D4W0TG
	e/xbvOA+oXjNQw09Q7pL8xSn9EIRl+V1Nu3/9d4bD5J/mUgzJ/rCaf+YJoGsLC7eYV7oOd4jVat
	EVKymrzEM88+nH422SWfLWGigmkDjsUqWcNN13a8wq44kFU6jDfEohSEx6hILN7TS8/DKiTRcJJ
	It2A6gyFgINvxLnG6dS6p9l9viuQuUIjGTIAS/HXE1iiklcv773TEeawq8fEq+8lp/wqdODABhL
	uHKwUOARd4aWKttUL9V1v/zAZ2IRNl8MVdpDvyfb0WsreRe8lKz8C3HKGMKktl/RnBSpeRHRk7d
	ie6L0+dLg1+6Z2xjLj/wb8razAg3H+b3W2W4xyRaw1iRFjctlXQIpmrsjXPhhwNTM4DPE4Qt9/M
	InIcyhvFs3avhEkEk=
X-Received: by 2002:a05:600c:350f:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-493c2b6e607mr144501925e9.19.1783073208553;
        Fri, 03 Jul 2026 03:06:48 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm222444665e9.2.2026.07.03.03.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:06:48 -0700 (PDT)
Date: Fri, 3 Jul 2026 12:06:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: sashiko-reviews@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Miroslav Benes <mbenes@suse.cz>, shuah@kernel.org,
	Zelin Deng <zelin.deng@linux.alibaba.com>,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akeJto1TC2CSs4Yw@pathway.suse.cz>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <20260703061449.246801F000E9@smtp.kernel.org>
 <akdyH7rRV1WHtBJ3@pathway.suse.cz>
 <20260703113019-678f1eb6-a061-435e-91a4-c0d76794b2cf@linutronix.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703113019-678f1eb6-a061-435e-91a4-c0d76794b2cf@linutronix.de>

On Fri 2026-07-03 11:32:30, Thomas Weiﬂschuh wrote:
> On Fri, Jul 03, 2026 at 10:26:07AM +0200, Petr Mladek wrote:
> > On Fri 2026-07-03 06:14:48, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] Incomplete fix and inconsistent state: The patch correctly unsets `sub_make_done` for the `kselftest` targets to allow Kbuild command-line reevaluation when building external kernel modules. However, it fails to apply the same logic to the `tools/` and `tools/%` targets, introducing a discrepancy between build entry points.
> > > --
> > > 
> > > commit 06c418388d65deb3d8494a6e8e7071c0e709186b
> > > Author: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > > 
> > > kbuild: unset sub_make_done before calling kselftest build system
> > > 
> > > This commit unsets sub_make_done before invoking the kselftest build system to
> > > ensure Kbuild reevaluates command-line flags when building test modules. It
> > > mirrors a previous fix done for scripts/install.sh.
> > > 
> > > > diff --git a/Makefile b/Makefile
> > > > index b9c5792c79e01..f717a4dc96d6a 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -1591,10 +1591,10 @@ tools/%: FORCE
> > > >  
> > > >  PHONY += kselftest
> > > >  kselftest: headers
> > > > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > > 
> > > [Severity: Medium]
> > > Will make tools/selftests still fail after this change?
> > > 
> > > The tools/ and tools/% targets in Makefile delegate to the tools build
> > > system, which can also trigger external kernel module builds (like bpf_testmod).
> > > 
> > > Because sub_make_done is not unset for these targets, invoking commands like
> > > make tools/selftests or make tools/all will skip Kbuild's M= argument parsing.
> > > 
> > > Should sub_make_done also be unset in the tools/ and tools/% targets to maintain
> > > consistency across the build entry points?
> > 
> > This might make sense. I see that the tools: and tools/%: targets are
> > defined right above the kselftest*: ones. And they are even advertised
> > in "make help" or "make tools/help".
> 
> I am not sure how the tools/ targets can reach back into kbuild.
> The example with bpf_testmod above is bogus, as tools/* is only for
> top-level tools directories. Subdirectories in tools/testing/selftests/
> don't seem to be reachable.

I see.

> > Well it probably should be done in a separate patch. It would be better
> > for bisecting potential regressions. Thomas, Zelin, what do you think, please?
> 
> If we do it for consistency it should be its own patch, agreed.

I would keep it as is until anyone reports a real problem.

Thanks a lot for explanation.

Best Regards,
Petr
