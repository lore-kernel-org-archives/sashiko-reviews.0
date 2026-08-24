Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E083E49C0
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 06:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552209; cv=none; b=cF4uxVA/WuDZSEKWuCOG8MFbxfCqHFn8lUKa87x9HT+4DqwhgfHfOQiLMNlG70w36NiILs+dIRJLh58sVaMqpq5F+dAmZq0TE4nPmKYWhblcd3SJfziiX7MLVWd/Q0aual772OfTPZNWAS8tM2m8DbnRLsRUA+KDyiM7Hbq2tng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552209; c=relaxed/simple;
	bh=dsKwyMTSl0c2JoLDgYqT8tFMLjWZ/n+uXCicxpa6Qas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qApNIOjPvHFIF4oiCmpebKdEzn0njfgSj9ssPv7HcAA7P47bO8vFbMVDSFNT+0ipDIYc0Zpg4buGxZC7I/noIY0TzmlqqqU6trQXJPIQXgwXc0loBmm01CTV//ZacDmMvrXEtf1pPRuvnBLK8CTTDHC3f8pgqP1Pv72uXJqYTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=0ByaOwP0; arc=none smtp.client-ip=212.227.17.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="0ByaOwP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1787552187; x=1788156987;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=dsKwyMTSl0c2JoLDgYqT8tFMLjWZ/n+uXCicxpa6Qas=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=0ByaOwP0SZumNBHP3ROvjYUZHI/LI9w7kT823vqT0LYgqLHsDNLEEsYhMXRoxcmE
	 it03wUDS8cZHKpiovlfyX/oPhf/PowPh0gmaLrYuRdNS+F9lihjtvrSWwgNQEaZNV
	 MZ6lDTC54rIibNw6QUYldG+yUJ/CWsxKcRr6+cueeKNLOB7SbjvvO+e/Cl7/qFLz4
	 5UZMgqk4q5a7h+JywJVXAJT8ZYX8X7uGjJzoA9xhF3wEP+hdAOL2XM3ufDgZ7gmJ5
	 /wjn90+I9FtQNq4Q/MTMhYknICprOMvK2iy8tdjR8YVVzxP97fdQmidV81gw5mrbg
	 2lFNbGq9yUrXgqKaFQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MX0TX-1xQd9v3gev-00IX4f; Mon, 24
 Aug 2026 08:16:26 +0200
Message-ID: <8ac39bd5-0ff6-41fb-95ac-946efde76375@oldschoolsolutions.biz>
Date: Mon, 24 Aug 2026 08:16:26 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 enable DisplayPort audio
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
 <20260823-blackrock-audio-v1-1-f319387fc6a6@oldschoolsolutions.biz>
 <20260823084234.73A1A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260823084234.73A1A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LxBqr9kii1YvZ/8xubGE4TzQSja5IY17rf65kP2NgAwQ4FymlN4
 ekQ03BBJDeemBig1WNyQ6eE4rt/jnrU+WtPyeTSU+zTTVxhKHdO4HpLKJZjXqOCub+a5fF/
 fXEZs2HtCtFe8CNyLlCoqsAvlleIdOHd6r0WJMVtpO4FmnxOI9nJYky9U/BcUEmCJWhCbX0
 pXxHQOPIkoKyqA8tyaFPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R5a4Am5LnHA=;V82XMKBL8UfhRGWhC+9XrwV5YIj
 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

Hi sashiko-bot,

On 23.08.26 10:42, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
> - [Medium] Incomplete cleanup: `&rxmacro` remains explicitly enabled des=
pite being unused.

You are absolutely right. I have disabled &rxmacro and everything still=20
works as it should. Thank you for the hint, cleanup will be in v2.

with best regards

Jens

