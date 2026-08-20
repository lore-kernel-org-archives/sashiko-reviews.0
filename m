Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF0240FDAC
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221014; cv=none; b=OxK/Ejx2vNWjn8OoGpL/y9bl3jV+SfnLleZKNOq2KlpWZz+Z3htjubl9iDVDi64QFyTB0HRuzPaUxsdSJd9FzQq7wcn2QLsZ4WqAeJcV/jWYjxyBUGAD93acLYghfaKUVtkQxFxMN0GVHi+KMGZW0ABna7QwzAQm/HW1cAiQxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221014; c=relaxed/simple;
	bh=Qd/JI2RknhrDFD1tAjUJMHCGXCHrd2LcWtSrsp+z1N0=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=F6bn4/sX4FkwRxB+YUa6d7V9fPqOL+fBVuD2lA/AgpgTQh+tZtQ7rxYSoNrueaxLOtEKGrj0gt0anu/2A7SNGZtVjVKkh8BtKC3nZ144bPAfq7pqd9VRHFmQXxy2YbzzGft7+AAx02pfRlF17mVnlktxgywT9Z9LcQ7o7JD1EB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qj5UxzNB; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qj5UxzNB"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Qd/JI2RknhrDFD1tAjUJMHCGXCHrd2LcWtSrsp+z1N0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787220994; v=1; x=1787825794;
 b=Qj5UxzNBLUdpm/vaN+4e1rJTM2+2NgpDZQEHhAmSIn4uOzF1E9Xwxew4yRtGy253S+5ftd+b
 hXHdaNAYX0/d1etIWSWukNQr43aBrSEnd745W30E3vmOgiOTSmib9lthHirCY+MqPzV9T3QgNPi
 lKK8Ceuud/vN1kNA82aNtxeU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from webmail.migadu.com (2001:41d0:303:fc7a::)
	by smtp.migadu.com with ESMTPS id 83f4da997bfb3a62;
	Thu, 20 Aug 2026 10:16:24 +0000
X-Mizu-Trace-ID: 83f4da997bfb3a62
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 10:16:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: gang.yan@linux.dev
Message-ID: <74e63e9935103e9fab16ea81e0ea7480f9c7d736@linux.dev>
TLS-Required: No
Subject: Re: [PATCH mptcp-next v3 5/5] Squash to "mptcp: pm: init and release
 mptcp_pm_ops"
To: "Matthieu Baerts" <matttbe@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: mptcp@lists.linux.dev
In-Reply-To: <f9fe2eb6-e9ef-42d0-8a24-8f5c550f0c78@kernel.org>
References: <20260819125629.49823-1-gang.yan@linux.dev>
 <20260819125629.49823-6-gang.yan@linux.dev>
 <20260819131205.3A0201F000E9@smtp.kernel.org>
 <7b85c6e1e4e270bd368fb7dc6d24279c1c20c3b2@linux.dev>
 <f9fe2eb6-e9ef-42d0-8a24-8f5c550f0c78@kernel.org>

August 20, 2026 at 5:07 PM, "Matthieu Baerts" <matttbe@kernel.org mailto:=
matttbe@kernel.org?to=3D%22Matthieu%20Baerts%22%20%3Cmatttbe%40kernel.org=
%3E > wrote:

> Can you first check if this can happen? I thought that
> mptcp_destroy_common would first close all subflows, remove the token,
> then release everything linked to the PM =E2=86=92 so the PM will no lo=
nger be
> called at that point for this msk, right? (I didn't check)
>

Hi Matt,

Thans for looking at this and kindly remind.
Yes, I just checked the order you described is right, but I thought it
could happen in such order:

CPU A (softirq)                                 CPU B(disconnect)
->subflow_token_join_request=20=20=20=20=20=20=20=20=20=20
->mptcp_token_get_sock()
=20                                             ->mptcp_destroy_common()
                                              ->pm_ops_release
->mptcp_pm_get_local_id():
  msk->pm.ops->get_local_id()   <- NULL deref

WDYT?  And, I think the window seems too narrow, we may not see it in pra=
ctice,
maybe a NULL check is enough?=20

Thanks
Gang
