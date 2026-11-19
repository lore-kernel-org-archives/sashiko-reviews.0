Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094919;
	b=xbUsQ9Ap8/7vALy6s1Fap6d3MxnBn2iWOY3TKh+XVP6LLWn0nM6KLJUrHpOlnf5QQxzI
	 AX0xCirTcY5LCJR3ZM+P66rY+hHXEC/D4R9IS2RZ75q8YFKCUFrfHraNP3jAyE3F6rmjV
	 QkoRyijfag+3XTsg9+3Di4QxHQUlAfRLjFvKrkion43qgRCtxmq6uZtiHN9+qAJmBGg4E
	 5j/IcuGSy/yw7Z2WGJMyMCeYj9w9SJmEBGBdW+Ohfc7igJkwY8oFPC4+yjGeEls7G7flS
	 usLEcP5UFTZzlCDKlRRv77xKivZ3uYdmo/e3usHXO0FKM8X7YFirKorBtx6ffKz/QyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:X-WP-MailID:
	 X-WP-AV:X-WP-SPAM;
	bh=nFs7LhyMy8k5jmGRKz1u70BSbgNhRCYabK2uhH/Xm0o=;
	b=XbeHrxJPdhbDcPA5JLq5KG/r6XFKoYBAyU61pWa1mqZmSl1ZlssDZJW7eJOALsT5v+Hd
	 YNXw3Vn/HO4cPvIIZXI3m33MkUkJGEv97swUdsPLCdphU3vA/hxwneozGBOIBPZ964Ih0
	 ywXtHwyUXOSUkuCvX2UgBJIGdpEnqY82MCEDbgmckJtmoBeuYcraVUfujn45BLaCJDXPV
	 NdDfNGfqz6tQOAN/CE0eZzGhmL64idTEqSec8XRT9R3lL0ErINDKDcp973fKBWMI9Zo23
	 Y1t0SKKzC0UlIi49JxypUyURui/n+5CiJ2byAoVNj3vqTBwwjbGdyrhgZ9QN5ZzICxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=V2TDVTkp;
	arc=none smtp.remote-ip=212.77.101.12
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC617606AA61
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 13:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC617606AA61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=V2TDVTkp
Received: (wp-smtpd smtp.wp.pl 40278 invoked from network); 19 Nov 2026 14:28:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1795094914; bh=nFs7LhyMy8k5jmGRKz1u70BSbgNhRCYabK2uhH/Xm0o=;
          h=From:To:Cc:Subject;
          b=V2TDVTkp6Twu60YGIv2NCg68IvYXBm+v+dlOqdyd/n5kGJgr51wVRE951Gash8RIs
           62/x215GUrBT+jYp9l/W43PkAqXQUGT7pn/9yUUN/3Y8MAEc9GA6xXs4igFqLij4ix
           0LsPtIfWP0u9JnWWd97zufqpUOKgxppFDcGP3sDIq3r/Ef/zhSdaQwE5u54lraiZXg
           I8YhZoQTCW+5R5EroEdhUC58nXkbDUMLEdTv9wSiPrrsCHwxzGpLoL1J9/z4hJTvBO
           jF+2IjGdHWzqP61HaFOSZ/bR0uH1/ioj0iUd4Qqa9wI28SLPJYY4weGVvvbSB6QKP/
           DhUwwEUfL9wDg==
Received: from localhost (77-236-5-223.static.play.pl [77.236.5.223])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <sashiko-reviews@lists.linux.dev>; 19 Nov 2026 14:28:34 +0100
Date: Thu, 19 Nov 2026 14:28:34 +0100
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: sashiko-reviews@lists.linux.dev
Cc: linux-modules@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jordan Rome <linux@jordanrome.com>,
	Viktor Malik <vmalik@redhat.com>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v3 2/3] module/kallsyms: sort text symbol indices and use
 binary search
Message-ID: <av75gob9XzeqglD7@wp.pl>
References: <20261118145125.29399-1-stf_xl@wp.pl>
 <20261118145125.29399-3-stf_xl@wp.pl>
 <sashiko-outbox-221282@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-221282@kernel.org>
X-WP-MailID: 783790f8ec710f57db30d5bf09b3768a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [kTPk]                               

On Wed, Nov 18, 2026 at 03:02:42PM +0000, sashiko-bot@kernel.org wrote:
> > +// static void pr_tab(unsigned int *tab, unsigned int n, Elf_Sym *syms)
> > +// {
> > +// 	int i;
> > +// 	// printk("\n");
> > +// 	for (i = 0; i < n; i++) {
> > +// 		printk(KERN_CONT "%d,", tab[i]);
> > +// 	}
> > +// 	printk("VALUES \n");
> > +// 	for (i = 0; i < n; i++) {
> > +// 		printk(KERN_CONT "0x%08llx,",
> > +// 		       (unsigned long long)syms[tab[i]].st_value);
> > +// 	}
> > +// 	printk("\n");
> > +// }
> > +//
> 
> [Severity: Low]
> Was this commented-out pr_tab() debug helper left in by mistake?

Yes. 

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261118145125.29399-1-stf_xl@wp.pl?part=2
