Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBDE35DA6D
	for <sashiko-reviews@lists.linux.dev>; Sun,  6 Sep 2026 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716273; cv=none; b=X++DJPj5TLDLISEOpn6a6TJ9P4r71vRAgV3bZS4a0/Z3ma0nHxB3Zr4UTE/FX2iJrgjsg8sztv8Yu9Les6ZugPHamDvYRel+C2VuhaJjafuoeGJJgpc9RBaxHWrSTzhYMcWP6YFResLDhE+NQ9cbtMfb5+Mex54sWi8GZuQ+dHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716273; c=relaxed/simple;
	bh=5nK/kdBjHaD/NMso66yY+d6rNmqA2+T5Z0LnOMGmHAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLaa5mdY1cjI7jL0CcjLTUZsheF5R91CEX5GMhkxred4zTlEi9fudb48+aJDWhDTgwUxN77z06b9vvK2FcESnFbS0WPVDEOip9yPvxz5UIWtvvbnltfHIdZrIhxN3NMR/tMdEXGp11SshfWZlr+ZCDbzSSACK8gbEIAk4XrRmos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=ZPcu2ZAe; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="ZPcu2ZAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788716251; x=1789321051;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=2f4fKMkS67eI3F2+CxELtuM9BfOh5FABiK5eMVC9zsU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZPcu2ZAe05HUHYxQ32E4rKBoQcsaAvyEPTlZp0Yyu5+gsLMtgKhvQLA3gzGuDksL
	 AVuq8wS5/z+3zgmWxqxkVX+UaqQN83OsPmwT9Hrf5iuRg3nf7WVn74xocLZ6bUfQ8
	 kH/C2M69tldewe0qX/DUofqOt8dYadLqBdMOGqNekZ+NTrtoyq6FbhzHgoiG1Snlm
	 GKPCiRSrCmKvr6pPr4T5nhdwPG5KeC3ho3tnmUqV2zXlsmGFrVYvwpdbw5BDP+vZn
	 Vk57H7mt1h/ILfUy8RoiE4jL965MZoCG4n7+fUnWERc0wTkpGTPeqfIf1rofAxwVP
	 uA9gfK8wzu3RioF0Mw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MJEAV-1xJ1ZQ1N87-00K7Lu; Sun, 06
 Sep 2026 19:37:31 +0200
Message-ID: <6266a94a-8a6d-42b2-ac8a-46dd4a16f87c@oldschoolsolutions.biz>
Date: Sun, 6 Sep 2026 19:37:30 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906123753.0E64D1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20260906123753.0E64D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ET/6Mms2lP9ZHXGvfnsrU7LePd9teVccbdgAqNihPyDk8FilPgW
 Pmb+utCpJpsg2ahi/GJbn3HICTj18e5YIOdsXSbbAMNxaL659yzyf7INwza4xZKynlYh+3O
 h1Mp1be0vQDLTPJrDVBPjGv9HTxnHhEyozA6wuCHQHZzdpFKNGpAiNlwWpQ11NteTHWYrAT
 zDiOc9du1cTuyE3tPMEyQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NC51LbwoKIM=;Jn0Bi2ehPQFB8Hgru84AFUrbrJ3
 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

Hi Sashiko-bot,

On 06.09.26 14:37, sashiko-bot@kernel.org wrote:
> [ ... ]
>
>> +&i2c0 {
>> +	clock-frequency =3D <400000>;
>> +
>> +	pinctrl-0 =3D <&qup_i2c0_data_clk>, <&tpad_default>, <&kybd_default>;
>> +	pinctrl-names =3D "default";
>> +	status =3D "okay";
> [Severity: Medium]
> Are the peripheral pinctrl states improperly assigned to the parent I2C =
bus
> controller here? Attaching &tpad_default and &kybd_default to the bus
> controller prevents the peripheral devices from independently managing t=
heir
> interrupt and wake pins during suspend/resume.
There were issues with individual pinctrls by device, the multiple=20
touchpad definitions would use the same pin. The workaround is to put=20
the pinctrl on the controller node. Of course this is not optimal, but a=
=20
working solution. The touchpad may be longer awake than required, but=20
this is better than not working.
>
> [ ... ]
>
>> +&pcie3_port0 {
>> +	perst-gpios =3D <&tlmm 143 GPIO_ACTIVE_LOW>;
>> +	wake-gpios =3D <&tlmm 145 GPIO_ACTIVE_LOW>;
>> +};
> [Severity: Medium]
> Should perst-gpios be named reset-gpios since it is placed on the port0 =
node?
> The generic PCI port handling expects reset-gpios, while perst-gpios is =
only
> parsed when placed on the host controller node (&pcie3). This leaves the
> device in reset.
Yes, that's true. Will be corrected in v2. I tested again with the=20
rename, card reader is working.
>> +&usb_1_ss2 {
>> +	dr_mode =3D "host";
>> +	maximum-speed =3D "high-speed";
>> +	phys =3D <&usb_1_ss2_hsphy>;
>> +	phy-names =3D "usb2-phy";
>> +	qcom,select-utmi-as-pipe-clk;
>> +	status =3D "okay";
>> +	/delete-property/ port@1;
>> +};
> [Severity: Medium]
> Should this use /delete-node/ port@1 instead of /delete-property/ port@1=
?
> In device tree bindings, port@1 is a node representing a Type-C connecti=
on,
> not a property, so /delete-property/ will leave the node intact in the f=
inal
> DTB.

Yes, you are absolutely right. Will be corrected in v2.

with best regards

Jens


