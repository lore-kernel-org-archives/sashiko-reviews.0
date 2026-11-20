Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201101;
	b=1E4gGOegvvef9a+/k3RCjJxlGmmL5oQV2VQJcvFhuHhi5dyenb3Z6n2h+3GWQ2r5rjvp
	 3SUkXbSPypRYGYK2k9xir5MUJ61Dj3x0sYfcR/OmXTusAMrBKtcLBFXFrv4JyorEGalkn
	 EKr6VMqJvCKGa5jMmpzVPN4OR0O7qJxjX4w/+7t78EC9mMxXNI7BUy4kKNwEou402e84m
	 XvtleSrfTGjHojwXEoM2BV5GqR+xbSRH3tstZWn9iI4HJG5Qho5EqeWckOjJZiK5+7qlc
	 f0a8yM5k0nYRwoFDVEVu5zjHzsb/KZy9Rx9F0Lo0VCyPIAlw19K5GkYkFWp/2kb+0zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201101;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=OhubdiDktGb/dI5xNWRc/wnryLgla9NgWN7iTJfqz/A=;
	b=ruDMSSgD5DibI1mU/kPcPPBB0Pkr5F/cXDsi5Dq+Ul7a2iqaJgbHZo5zOiT0FwNR4Yp5
	 U5GrQoAsbdypNgu/m1lQ9ybeo/RGLclc4SdjzvyLIB9SPl0SZqD7R+5mmUR9VIIcn8MjD
	 B6lBIo2hirvGdVOrIyPGZ2PU2Te5RoUto/QFwyaHplusRLY5vT6BEC2VhbQ8nBesyuIpS
	 DpMcsommRbKOQHocStRj6+i2nJzzYW6eawEm7HNxYMotVb2I1veYCAIvWIEQJEp/oDHPe
	 /sT8BnpHF/qcLxVKRccUkQkdDFoHWLKEKQtIScYeHXOokagoMRUzdh/Pn866TYMTbGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=fI4zx0kW;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=zqo0r2Nj;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01211606A32C
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 18:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01211606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=fI4zx0kW;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=zqo0r2Nj
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 1289F1D004C3
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 13:58:18 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 20 Nov 2026 13:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795201091;
	 x=1795287491; bh=OhubdiDktGb/dI5xNWRc/wnryLgla9NgWN7iTJfqz/A=; b=
	fI4zx0kWv4tjdxUH7Fk/YVkSfFKTP1FBPqYZz8rclWIdNP2+iMaa65SBLX1b1kJQ
	/5paWyTPy5oP4kyKDyT4jFL2B8RTVP568FVNRDg80m4Wd6gJvith7rY+ImuTZTI5
	QbmCDS8886TWT4LYAaDaBEB0KtFNfaCopGcqTHhYs0tpFN6BGFAXqhUQ2jRKQggO
	0usgI6RmhbM8jSEkRqLBc5dfOUhOVXYL32f5oqDCoKLO2aqNrk7PBlj47HK5O0HF
	SZ1RwdWmf9YFmc5i0ceaSEjXMfVaxHknZkaVgYaiDm0ujslbNwzWFyYMmUlAKm2G
	qC5PSIa1Zv0gia34WEZ4Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795201091; x=
	1795287491; bh=OhubdiDktGb/dI5xNWRc/wnryLgla9NgWN7iTJfqz/A=; b=z
	qo0r2Nj7bB3sPTuqKlwvCrk3lfNENTS7YZyP+7DKMFzVe6pIekxbLkPfozUG3shr
	G9NFqW0T1jvgTVFCJAXEdCd9mhyuDlubygwspyyfgkAGKnYnsZ6hjGobxrs5oRZO
	jhwUHbn/WffPaTgIpZaiwEwuU8WLTUewhmmdp4XeQ/Bh/H3wu+kXMXJBI0VufpR+
	jVLqQBh9QGC7ISjv0uLDzax70frm4jFbZvC7op8WUJPtA+C0sXdNuXFX1FiyBzXf
	2yubkS8127uPFsgYJBUj/WmuGLRpGY3cRKEr8WxRVCuSxR2zjtmsjeTMbpe8W0xp
	tJ9RV/wI4cyO4zlTcpGFg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795201091; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:NXd5e9NHQuLNaCZNTA6s+TDP4cMRy9vdhFyG/x5FykHsIRD
	+4hKXroqmUpYP72Tb6Q6QKTQbxavkxMS62ghEUmw7r5SFPm2Vvnf3y4be2fSQAw+
	cAZX3Dg/uV16tI5VXOxpyMrydvd5Y7RfE02xZ+DT86NQ20lUFVy/xH+SCfglRBkC
	nqLnBse8VPGsELV9O+tAH7+0z1Tbt2Lv5xFuG8JuLsl03YIfH2/w9e1j5WyhkQne
	yCHp1ujYdcUnUdGEimQtc1uiEp6+dXGUCyxDVMol7ozkxhuQ/84GSHXAfOhEyGLX
	xBPU9FPoKdRs01JwtRKZxQiAHZ/R6OWIS0B+3WA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Q37SVA7hNjYu6K0SdtKZ77uaZfy8rDJkm3H2aJB/Mxo=:EZv6T3kLr100RKODKfNeG/qI6S8Fj88SGKLUy2b/qns=;
X-ME-Sender: <xms:OpgAa_2nZuuSI2jcLLlw1dDNgzbZEjmEQ_CTcuLcv83R___AjfYs4A>
    <xme:OpgAa46obZSyLfkI0-OT_8a_nRhqHXD2Rb3zzoJuBzYh320HiG30QNXPrakGXT-nT
    VJbx0Pa-D9XkIEj43n-IyIWELnAhBdYd08NlKHnNSgO2QHIbNDSpMgW>
X-ME-Proxy-Cause: dmFkZTE7r8RF9hSqcjftvuz9PAP06UPcR+hYqB2uT01HIoj+VLarW6XaBBKdQCQdBgjBmw
    gUtUc+O0P5VBgZW4/43bdwNalmC4lXZ6XtzRmdZ3X0UvTRh5bGP5RfDr8IkJe7dM3QiVnC
    OZmQIPBjf0t3ig5uWvFMP1eIfMmlJ7tSEeFT245M+Ss+CzBPUlU+JN6uxIOsNWCEWkkNkK
    NyfPtf55YwmEb6maQUYsGedwyy8i+B9JPbr/UWeYMqpW/pKEB/T3TZATPStk/a7ka2ZnH6
    ua2vO9EciUBIOAF9LeTyPaZuGtplgXA8t9nQb3HfIrbsfT+TkFRMbfJvbaU7goncg4T5dN
    FOc6Of44BeQrFXxIViL6+Q5TRvE36y1xEUosO8K0k3yjLAloKzEkeX696+MXRoTalaSdtd
    VgcTl1aTEXwFhMPo6E49UkQ7B955VbaK2gp/srAgTYPoUDFYJ+DKD7SUPcDRk8Ef7FTh5n
    Q6YDsH3WSiwgKqGRc3XJeywNJiAr+Hx6q5bM+7P+ac8i4jqsynR2S+ju+2MIcV0yaVUujf
    hONzrEoY8zM6hurYwx9yP69NChRJiTsGpU1U3Zha1ipKTbOChTNBgcztBhJyeeD+ZG30Dg
    AQV4LMIjsWjppkZwA39goTWYGi2cOsyqXiAmscD8pJtkEPVlxJe50BLgu7Ng
X-ME-Proxy: <xmx:PZgAazxK_pyiqGjQemOJZEbqHlEgRy4CyYfFsTlyecyAK_l2hWp9iQ>
    <xmx:PZgAa6unruGsVyABk8XjZyq4hMOsMilQzDuaS1OLIuN9eRj1rCSuZQ>
    <xmx:PZgAa-YK0HGFdkoCIG6Kng6NXW2inNUCf7IkZntZDZdDMSW9O2esCw>
    <xmx:PZgAax27ERP2xOW6r5yqmDPzJPKS5nSCZObODpiuQCcr3w-haubQcA>
    <xmx:Q5gAa_ik1ZVbWP_H3gg0B2JVLPvWblO86PdWzWCEGti3MIL8FOnNosa7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 87B6532A0099; Fri, 20 Nov 2026 13:58:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AQsIS8mXxcAZ
Date: Fri, 20 Nov 2026 19:57:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 sashiko-reviews@lists.linux.dev, "Arnd Bergmann" <arnd@kernel.org>,
 "Gregory Price" <gourry@gourry.net>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: larips <larips950@gmail.com>, "Zi Yan" <ziy@nvidia.com>,
 "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Rakie Kim" <rakie.kim@sk.com>,
 "Ying Huang" <ying.huang@linux.alibaba.com>,
 "Lorenzo Stoakes" <ljs@kernel.org>,
 "Brendan Jackman" <brendan.jackman@linux.dev>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "Jackie Liu" <liuyun01@kylinos.cn>,
 linux-mm@kvack.org
Message-Id: <ae01d623-2b72-49f2-8d52-069bc089f448@app.fastmail.com>
In-Reply-To: <87218525-12f3-4259-9950-877c8e36c83e@kernel.org>
References: <20261117211635.2472067-1-arnd@kernel.org>
 <sashiko-outbox-221983@kernel.org>
 <c420ec17-b297-469a-927a-85934a05fda4@app.fastmail.com>
 <3b00e53f-b4eb-41d4-b3e6-791660da3342@kernel.org>
 <45a71e8e-0c8c-4b5e-96c9-be6f2ad0e364@app.fastmail.com>
 <87218525-12f3-4259-9950-877c8e36c83e@kernel.org>
Subject: Re: [PATCH 1/2] [v2] mm/mempolicy: fix copy_nodes_to_user() for odd inputs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Nov 20, 2026, at 11:39, David Hildenbrand (Arm) wrote:
> On 11/20/26 11:16, Arnd Bergmann wrote:
>> On Fri, Nov 20, 2026, at 10:55, David Hildenbrand (Arm) wrote:
>> 
>> I like this version as well.
>
> Does your #2 still apply once we would have that (in a reworked form)?
>
> I'd appreciate if you could resend based on my suggestion. Feel free to adjust
> what you want and just keep it to a Suggested-by (No need for Author,
> co-developed-by or any of that).

Ok, sent a v3 with a minimal fix for backporting and the combination of
your cleanup and mine as the second patch. Thanks,

    Arnd
